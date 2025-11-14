variable "region" {}
variable "cidr_block" {}
variable "private_cidr_block" {}
variable "public_cidr_block" {}
variable "availability_zone" {}
variable "ami_id" {}
variable "instance_type" {}

variable "key_name" {
	description = "AWS key pair name to create/use"
	type        = string
	default     = "terraform-ansible-key"
}

variable "public_key_path" {
	description = "Path to the public key file to upload as the AWS key pair (use full path, e.g. /home/you/.ssh/terraform_ansible_key.pub)"
	type        = string
}
