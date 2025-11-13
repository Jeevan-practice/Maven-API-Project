variable "ami_id" {}
variable "instance_type" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "instance_name" {
  default = "maven-ec2-instance"
}
