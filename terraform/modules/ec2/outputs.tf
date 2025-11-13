output "instance_id" {
  value       = aws_instance.ec2-instance.id
  description = "EC2 instance ID"
}

output "instance_public_ip" {
  value       = aws_instance.ec2-instance.public_ip
  description = "Public IP address of EC2 instance"
}

output "security_group_id" {
  value       = aws_security_group.maven-sg.id
  description = "Security group ID"
}
