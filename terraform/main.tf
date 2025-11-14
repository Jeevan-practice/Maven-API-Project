provider "aws" {
  region     = var.region
}
module "create-vpc" {
  source = "./modules/vpc"
  cidr_block = var.cidr_block
  private_cidr_block = var.private_cidr_block
  public_cidr_block = var.public_cidr_block
  availability_zone = var.availability_zone
}
module "create-ec2" {
  source = "./modules/ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type
  vpc_id = module.create-vpc.vpc_id
  subnet_id = module.create-vpc.public_subnet_id
  key_name = var.key_name
  public_key = file(var.public_key_path)
}