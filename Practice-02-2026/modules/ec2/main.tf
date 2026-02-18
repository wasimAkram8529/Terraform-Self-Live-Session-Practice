resource "aws_instance" "web-server" {
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.sg]
  subnet_id = var.subnet

  user_data = <<EOF
  #!/bin/bash
  sudo apt-get update -y
  sudo apt-get install -y nginx
  echo "Hello From Server ${var.tag}" | sudo tee /var/www/html/index.html
  sudo systemctl start nginx
  sudo systemctl enable nginx
  EOF
  tags = {
    Name = var.tag
  }
}