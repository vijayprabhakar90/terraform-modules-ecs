output "target_group_arns" {
  value = aws_lb_target_group.tg[*].arn
}

output "ecs_service_ids" {
  value = aws_ecs_service.main[*].id
}
