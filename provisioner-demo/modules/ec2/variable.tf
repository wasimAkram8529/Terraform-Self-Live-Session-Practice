variable "ami" {
  description = "Image Id"
  default = "ami-0ecb62995f68bb549"
}

variable "instance_type" {
  description = "Instance type"
  default = "t2.micro"
}
variable "instance_name" {
  description = "Name of the instance"
}
variable "sg" {
  description = "Security Group"
}