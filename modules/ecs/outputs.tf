output "cluster_arn" {
  value = aws_ecs_cluster.main.arn
}

output "target_group_arns" {
  value = aws_lb_target_group.tg[*].arn
}

output "ecs_service_arns" {
  value = aws_ecs_service.main[*].arn
}
