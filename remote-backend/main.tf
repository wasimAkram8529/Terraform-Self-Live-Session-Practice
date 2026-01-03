provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "webserver" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name

  tags = {
    name = "webserver"
  }
}