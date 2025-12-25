variable "ami" {
  description = "Image Id"
  default = "ami-0ecb62995f68bb549"
}

variable "instance_type" {
  description = "Instance type"
  default = "t2.micro"
}
variable "subnet_id" {
  description = "Subnet Id"
}
variable "security_group_id" {
  description = "Security Group Id"
}
variable "instance_name" {
  description = "Name of the instance"
}