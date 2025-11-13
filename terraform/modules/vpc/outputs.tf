output "vpc_id" {
  value       = aws_vpc.maven-vpc.id
  description = "VPC ID"
}

output "public_subnet_id" {
  value       = aws_subnet.maven-public-subnet[0].id
  description = "Public subnet ID"
}

output "private_subnet_id" {
  value       = aws_subnet.maven-private-subnet[0].id
  description = "Private subnet ID"
}
