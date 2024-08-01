provider "aws" {
  region = var.region
}

module "ecs_task_definition" {
  source = "./ecs_task_definition"

  family                = var.task_definition_family
  container_definitions = var.container_definitions
  cpu                   = var.ecs_cpu
  memory                = var.ecs_memory
  execution_role_arn    = var.execution_role_arn
  task_role_arn         = var.task_role_arn
}

module "ecs" {
  source = "./ecs"

  cluster_name     = var.cluster_name
  service_name     = var.service_name
  task_definition  = var.task_definition_arn
  desired_count    = var.desired_count
  target_group_arn = var.lb_target_group_arn
  container_name   = var.container_name
  container_port   = var.container_port
  subnet_ids       = var. public_subnets
  security_groups  = var.alb_sg_id
}