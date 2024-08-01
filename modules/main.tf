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
  task_definition  = module.ecs_task_definition.task_definition_arn
  desired_count    = var.desired_count
  target_group_arn = module.alb.lb_target_group_arn
  container_name   = var.container_name
  container_port   = var.container_port
  subnet_ids        = module.vpc.public_subnets
  security_groups   = [module.alb.alb_sg_id, module.alb.ecs_sg_id]
}