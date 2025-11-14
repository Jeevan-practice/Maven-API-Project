output "instance_public_ip" {
  description = "Public IP address of EC2 instance created by the ec2 module"
  value       = module.create-ec2.instance_public_ip
}
