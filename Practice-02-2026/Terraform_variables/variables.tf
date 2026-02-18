variable "instance_type" {
  type = string

  validation {
    condition = substr(var.instance_type, 0, 8) == "t2.micro"
    error_message = "Please use free tier of instance type"
  }
}

variable "ami" {
  type = string

  validation {
    condition = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
    error_message = "Please provide a valid AMI"
  }
}

variable "sg_ports" {
  type = map(list(number))
  default = {
    "ec2_sg" = [ 22, 80 ]
    "alb_sg" = [ 22 ]
  }
}