variable "region" {
  description = "AWS Region"
  type        = string
}

variable "cluster_name" {
  description = "ECS Cluster Name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnets" {
  description = "List of subnets"
  type        = list(string)
}

variable "security_groups" {
  description = "List of security groups"
  type        = list(string)
}

variable "execution_role_arn" {
  description = "ECS execution role ARN"
  type        = string
}

variable "task_role_arn" {
  description = "ECS task role ARN"
  type        = string
}

variable "target_groups" {
  description = "List of target groups"
  type = list(object({
    name     = string
    port     = number
    protocol = string
  }))
}

variable "listener_rules" {
  description = "List of listener rules"
  type = list(object({
    listener_arn = string
    priority     = number
    host         = string
  }))
}

variable "ecs_services" {
  description = "List of ECS services"
  type = list(object({
    service_name         = string
    family               = string
    container_definitions = list(object({
      name                = string
      image               = string
      essential           = bool
      portMappings        = list(object({
        containerPort = number
        hostPort      = number
      }))
      memoryReservation = number
    }))
    cpu              = string
    memory           = string
    desired_count    = number
    container_name   = string
    container_port   = number
  }))
}
