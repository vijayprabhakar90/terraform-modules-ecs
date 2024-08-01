provider "aws" {
  region = var.region
}

module "ecs" {
  source = "./ecs"
  region          = var.region
  cluster_name    = var.cluster_name
  vpc_id          = var.vpc_id
  subnets         = var.subnets
  security_groups = var.security_groups
  execution_role_arn  = var.execution_role_arn
  task_role_arn     = var.task_role_arn
  target_groups     = var.target_groups
  listener_rules    = var.listener_rules
  ecs_services      = var.ecs_services
}