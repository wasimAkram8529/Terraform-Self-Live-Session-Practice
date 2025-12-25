variable "ami" {
  type = string
  description = "Amazon Machine Image for ec2 instance"
  default = "ami-0ecb62995f68bb549"
  validation {
    condition = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
    error_message = "Please provide a valid AMI ID"
  }
}

variable "instance_type" {
  type = string
  description = "Instance type of ec2 instance"
  default = "t2.micro"
  sensitive = true
}

variable "tags" {
  type = object({
    name = string
  })
  description = "Tag value for ec2 instance"
  default = {
    name = "webserver"
  }
}

