provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "sg" {
  name = "${terraform.workspace}"
}

resource "aws_vpc_security_group_ingress_rule" "sg_ingress_rule_for_ssh" {
  security_group_id = aws_security_group.sg.id
  ip_protocol = "tcp"
  from_port = 22
  to_port = 22
  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "sg_ingress_rule_for_http" {
  security_group_id = aws_security_group.sg.id
  ip_protocol = "tcp"
  from_port = 80
  to_port = 100
  cidr_ipv4 = "0.0.0.0/0"
}