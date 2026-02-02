variable "splunk" {
  default = "8088"
}

variable "https_port" {
  default = "443"
}

variable "dev_app_port" {
  default = "8080"
}

variable "prod_app_port" {
  default = "8443"
}

variable "cidr_allowed_ip" {
  default = "172.31.0.0/16"
}