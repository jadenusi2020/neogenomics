output "vpc_id" {
  description = "IThe ID of the created VPC."
  value       = module.network.vpc_id
}

output "public_subnet_id" {
  description = "The ID of the public subnet."
  value       = module.network.public_subnet_id
}

output "internet_gateway_id" {
  description = "The ID of the internet gateway."
  value       = module.network.internet_gateway_id
}
