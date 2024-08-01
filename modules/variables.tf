variable "region" {
  description = "AWS region"
  type        = string
}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "task_definition_family" {
  description = "Family name for the ECS task definition"
  type        = string
}

variable "container_definitions" {
  description = "JSON-encoded string containing the container definitions"
  type        = string
}

variable "desired_count" {
  description = "Desired number of ECS tasks"
  type        = number
}

variable "container_name" {
  description = "Name of the container"
  type        = string
}

variable "container_port" {
  description = "Port on which the container is listening"
  type        = number
}

variable "ecs_cpu" {
  description = "The number of cpu units used by the ECS task"
  type        = string
}

variable "ecs_memory" {
  description = "The amount of memory (in MiB) used by the ECS task"
  type        = string
}

variable "execution_role_arn" {
  description = "ECS execution role arn"
  type = string  
}

variable "task_role_arn" {
  description = "ECS task role arn"
  type = string  
}

variable "lb_target_group_arn" {
  description = "Target group arn for creating the service as part of ELB"
  type = string
}

variable "alb_sg_id" {
  description = "List of security groups for ecs service"
  type = list(string)

}
variable "public_subnets" {
  description = "List of public subnets for ecs service"
  type = list(string)
}

variable "target_group" {
  description = "Target group values"
  type = list(object)
}

variable "listener_rules" {
  description = "Listener rules"
  type = list(object)
}

