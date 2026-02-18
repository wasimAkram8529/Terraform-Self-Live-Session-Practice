variable "vpc_id" {
  type = string
}

variable "sg_ports" {
  type = map(list(number))

  default = {
    ec2_sg = [22, 80]
    alb_sg = [80]
  }
}
