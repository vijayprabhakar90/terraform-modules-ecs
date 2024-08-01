resource "aws_ecs_service" "main" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.main.id
  task_definition = var.task_definition
  desired_count   = var.desired_count

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  launch_type = "FARGATE"
  
  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = var.security_groups
    assign_public_ip = true
  }

}
