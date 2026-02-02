output "ec2_public_ip" {
  value = aws_instance.ec2.public_ip
}

output "ec2_instance_ids" {
  value = aws_instance.ec2.id
}