variable "subnet_id" {}
variable "vpc_id" {}
variable "instance_profile" {}
variable "associate_public_ip" {
  default = true
}
variable "name" {}
variable "security_group_id" {}
