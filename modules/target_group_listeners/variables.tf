variable "region" {
  description = "AWS Region"
  type        = string
}

variable "name" {
  description = "name"
  type = string
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

variable "vpc_id" {
  description = "VPC ID"
  type = string
}