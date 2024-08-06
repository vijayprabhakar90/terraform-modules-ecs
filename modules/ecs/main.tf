provider "aws" {
  region = var.region
}

resource "aws_lb_target_group" "tg" {
  count = length(var.target_groups)
  
  name     = replace(var.target_groups[count.index].name, "/[^a-zA-Z0-9-]/", "-")
  port     = var.target_groups[count.index].port
  protocol = var.target_groups[count.index].protocol
  vpc_id   = var.vpc_id
  target_type = "instance"
}

resource "aws_lb_listener_rule" "rule" {
  count = length(var.listener_rules)

  listener_arn = var.listener_rules[count.index].listener_arn
  priority     = var.listener_rules[count.index].priority
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg[count.index].arn
  }
  condition {
    host_header {
      values = [var.listener_rules[count.index].host]
    }
  }
}

resource "aws_ecs_task_definition" "main" {
  count = length(var.ecs_services)

  family                = var.ecs_services[count.index].family
  requires_compatibilities = ["EC2"]
  execution_role_arn    = var.execution_role_arn
  task_role_arn         = var.task_role_arn
  container_definitions = jsonencode(var.ecs_services[count.index].container_definitions)
}

resource "aws_ecs_service" "main" {
  count = length(var.ecs_services)

  name            = var.ecs_services[count.index].service_name
  cluster         = var.cluster_name
  task_definition = aws_ecs_task_definition.main[count.index].arn
  desired_count   = var.ecs_services[count.index].desired_count
  launch_type     = "EC2"
  network_configuration {
    subnets         = var.subnets
    security_groups = var.security_groups
    assign_public_ip = true
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.tg[count.index].arn
    container_name   = var.ecs_services[count.index].container_name
    container_port   = var.ecs_services[count.index].container_port
  }
}
