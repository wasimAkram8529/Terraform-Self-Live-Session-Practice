provider "aws" {
  region = "us-east-1"
}

locals {
  config_args = {
    ami = "ami-0ecb62995f68bb549"
    instance_type = "t2.micro"
  }
}

resource "aws_instance" "webserver" {
  ami = local.config_args.ami
  instance_type = local.config_args.instance_type
}