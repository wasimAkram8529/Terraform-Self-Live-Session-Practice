output "web-server-public-id" {
  value = aws_instance.web-server.public_ip
}

output "instance_id" {
  value = aws_instance.web-server.id
}