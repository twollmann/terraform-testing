variable "ssh_fingerprint" {}

variable "private_key" {}

variable "user" {}

variable "default_domain" {}

variable "do_token" {}

variable "region" {
  default = "fra1"
}

variable "image" {
  default = "centos-6-x64"
}

variable "web_count" {
  default = "2"
}

variable "web_size" {
  default = "512mb"
}

variable "lb_count" {
  default = "1"
}

variable "lb_size" {
  default = "512mb"
}
