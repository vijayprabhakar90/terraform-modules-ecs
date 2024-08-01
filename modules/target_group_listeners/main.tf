resource "aws_lb_target_group" "tg" {
  count = length(var.target_groups)
  
  name     = var.target_groups[count.index].name
  port     = var.target_groups[count.index].port
  protocol = var.target_groups[count.index].protocol
  vpc_id   = var.vpc_id
  target_type = "ip"

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "${var.name}-tg"
  }
}

resource "aws_lb_listener_rule" "rule" {
  count = length(var.listener_rules)

  listener_arn = var.listener_rules[count.index].listener_arn
  priority     = var.listener_rules[count.index].priority
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg[count.index].arn
  }
  condition {
    host_header {
      values = [var.listener_rules[count.index].host]
    }
  }
}


output "target_group_arns" {
  value = aws_lb_target_group.tg[*].arn
}