terraform {
  required_providers {
    aws = {
      version = "~> 6.32"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


data "aws_subnets" "subnets" {
  filter {
    name = "vpc-id"
    values = ["vpc-0aa50acef130117db"]
  }
}

resource "aws_security_group" "sg" {
  for_each = var.sg_ports

  name = each.key

  dynamic "ingress" {
    for_each = each.value

    content {
      protocol = "tcp"
      from_port = ingress.value
      to_port = ingress.value
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress  {
    protocol = "tcp"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_server" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = data.aws_subnets.subnets.ids[1]
  vpc_security_group_ids = [aws_security_group.sg["ec2_sg"].id]
  
  user_data = <<EOF
  #!/bin/bash
  sudo apt-get update -y
  sudo apt-get install -y nginx
  echo "Hello From Server $(hostnam -i)" | sudo tee /var/www/html/index.html
  sudo systemctl start nginx
  sudo systemctl enable nginx
  EOF
  
  # key_name = "Ansible_key"

  # provisioner "remote-exec" {
  #   inline = [ 
  #     "sudo apt-get update -y",
  #     "sudo apt-get install -y nginx",
  #     "echo 'Hello From Server $(hostnam -i)' | sudo tee /var/www/html/index.html",
  #     "sudo systemctl start nginx",
  #     "sudo systemctl enable nginx"
  #    ]
  # }

  # connection {
  #   type = "ssh"
  #   user = "ubuntu"
  #   private_key = "~/.ssh/Ansible_key.pem"
  #   host = self.public_ip
  # }

  tags = {
    Name = "Web_server"
    Environment = "Dev"
  }
}