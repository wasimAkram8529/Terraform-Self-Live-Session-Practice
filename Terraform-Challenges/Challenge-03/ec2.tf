resource "aws_instance" "ec2_instance" {
  for_each = var.instance_config
  instance_type = each.value.instance_type
  ami = each.value.ami
  
  tags = {
    Name = each.key
  }
}