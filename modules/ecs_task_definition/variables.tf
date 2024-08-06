variable "family" {
  description = "Family name for the ECS task definition"
  type        = string
}

variable "container_definitions" {
  description = "JSON-encoded string containing the container definitions"
  type        = string
}

/*variable "cpu" {
  description = "The number of cpu units used by the task"
  type        = string
  default     = "256"
}

variable "memory" {
  description = "The amount of memory (in MiB) used by the task"
  type        = string
  default     = "512"
}*/

variable "execution_role_arn" {
  description = "The ARN of the task execution role"
  type        = string
}

variable "task_role_arn" {
  description = "The ARN of the task role"
  type        = string
}
