resource "aws_lb" "alb" {
  name = "demo-web-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [var.alb_sg]
  subnets = var.subnet_ids
}

resource "aws_lb_target_group" "alb-tg" {
  name = "demo-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
}

resource "aws_lb_listener" "http-rule" {
  load_balancer_arn = aws_lb.alb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.alb-tg.arn
  }
}

resource "aws_lb_target_group_attachment" "ec2-attach" {
  count = length(var.instance_ids)
  target_group_arn = aws_lb_target_group.alb-tg.arn
  target_id = var.instance_ids[count.index]
  port = 80
}