output "ec2-sg-id" {
  value = aws_security_group.ec2_sg.id
}

output "alb-sg-id" {
  value = aws_security_group.alb-sg.id
}