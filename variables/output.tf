output "public_ip" {
  value = aws_instance.webserver.public_ip
}

output "public_dns" {
  value = aws_instance.webserver.public_dns
}

output "sg"{
  value = aws_instance.webserver.security_groups
}

output "vpc_id" {
  value = aws_instance.webserver.vpc_security_group_ids
}