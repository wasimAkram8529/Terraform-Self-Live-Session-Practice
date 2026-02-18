variable "vpc_id" {
  type = string
  default = "vpc-123456"
}

variable "sg_ports" {
  type = object({
    ec2-sg = list(string)
    alb-sg = list(string)
  })

  default = {
    ec2-sg = [22, 80]
    alb-sg = [ 80 ]
  }
}

resource "aws_security_group" "sg" {

  for_each = var.sg_ports

  name   = each.key
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = each.value

    content {
      protocol    = "tcp"
      from_port   = ingress.value
      to_port     = ingress.value
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# resource "aws_security_group" "alb-sg" {
#   name = "alb-sg"
#   vpc_id = var.vpc_id

#   ingress {
#     from_port = 80
#     to_port = 80
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port = 0
#     to_port = 0
#     protocol = -1
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }