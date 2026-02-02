resource "aws_instance" "ec2" {
  ami = "ami-0ecb62995f68bb549"
  instance_type = "t2.micro"
  subnet_id = var.subnet
  vpc_security_group_ids = [var.sg]
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