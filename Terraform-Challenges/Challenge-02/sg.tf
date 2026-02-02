
resource "aws_security_group" "sg_payment_app" {
  name        = "payment_app"
  description = "Application Security Group"
  depends_on  = [aws_eip.example]

  # Below ingress allows HTTPS  from DEV VPC
  ingress {
    description = "ingress allows HTTPS  from DEV VPC"
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = "tcp"
    cidr_blocks = [var.cidr_allowed_ip]
  }

  # Below ingress allows APIs access from DEV VPC

  ingress {
    description = "ingress allows APIs access from DEV VPC"
    from_port   = var.dev_app_port
    to_port     = var.dev_app_port
    protocol    = "tcp"
    cidr_blocks = [var.cidr_allowed_ip]
  }

  # Below ingress allows APIs access from Prod App Public IP.

  ingress {
    description = "ingress allows APIs access from Prod App Public IP"
    from_port   = var.prod_app_port
    to_port     = var.prod_app_port
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.example.public_ip}/32"]
  }

  egress {
    description = "Allow splunk"
    from_port   = var.splunk
    to_port     = var.splunk
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Payment app"
    Team = "Payment team"
    Env  = "Production"
  }
}