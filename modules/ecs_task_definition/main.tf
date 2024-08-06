resource "aws_ecs_task_definition" "main" {
  family                = var.family
  container_definitions = var.container_definitions
  network_mode           =  "bridge"
  requires_compatibilities = ["EC2"]
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn

  tags = {
    Name = var.family
  }
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.main.arn
}
