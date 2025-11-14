variable "ami_id" {}
variable "instance_type" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "instance_name" {
  default = "maven-ec2-instance"
}

variable "key_name" {
  description = "Name for the AWS key pair to create/use"
  type        = string
  default     = "terraform-ansible-key"
}

variable "public_key" {
  description = "Public key contents for the AWS key pair. Pass using file(path) from root module."
  type        = string
}
