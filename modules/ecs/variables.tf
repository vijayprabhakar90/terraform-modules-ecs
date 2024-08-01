variable "service_name" {
  description = "Name of the ECS Service"
  type        = string
}

variable "task_definition" {
  description = "ECS Task Definition"
  type        = string
}

variable "desired_count" {
  description = "Desired number of ECS tasks"
  type        = number
}

variable "target_group_arn" {
  description = "ARN of the target group"
  type        = string
}

variable "container_name" {
  description = "Name of the container"
  type        = string
}

variable "container_port" {
  description = "Port on which the container listens"
  type        = number
}

variable "subnet_ids" {
  description = "The IDs of the subnets to launch the service into"
  type        = list(string)
}

variable "security_groups" {
  description = "The security groups associated with the service"
  type        = list(string)
}