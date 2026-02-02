
variable "instance_config" {
  type = map
  default = {
    instance1 = { instance_type = "t2.micro", ami = "ami-0ecb62995f68bb549" }
    instance2 = { instance_type = "t2.small", ami = "ami-0ecb62995f68bb549" }
  }
}
