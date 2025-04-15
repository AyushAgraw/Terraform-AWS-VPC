output "VPC" {
  description = "VPC Details"
  value       = aws_vpc.name
}

output "Subnet" {
  description = "Subnet Details"
  value = aws_subnet.name
}

