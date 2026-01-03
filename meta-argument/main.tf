provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami = "ami-068c0051b15cdb816" // Amazon Linux AMI
  # ami = "ami-0ecb62995f68bb549" // Ubuntu AMI
  instance_type = "t2.micro"

  tags = {
    Name = "WebServer"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [tags]
  }
}