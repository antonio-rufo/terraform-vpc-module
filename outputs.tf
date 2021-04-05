###############################################################################
# VPC
###############################################################################
output "vpc_id" {
  description = "The ID of the VPC"
  value       = concat(aws_vpc.vpc.*.id, [""])[0]
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = concat(aws_vpc.this.*.cidr_block, [""])[0]
}

###############################################################################
# Gateways
###############################################################################
output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = concat(aws_internet_gateway.internet_gw.*.id, [""])[0]
}

output "nat_gw_ids" {
  description = "List with the IDs of the NAT Gateways created on public subnets to provide internet to private subnets"
  value       = aws_nat_gateway.nat_gw.*.id
}

###############################################################################
# AWS Subnets - Public
###############################################################################
output "public_subnets_ids" {
  description = "List with the Public Subnets IDs"
  value       = aws_subnet.public.*.id
}

output "public_subnets_route_table_id" {
  description = "ID of the Route Tables used on Public networks"
  value       = aws_route_table.public.*.id
}

###############################################################################
# AWS Subnets - Private
###############################################################################
output "private_subnets_ids" {
  description = "List with the Private Subnets IDs"
  value       = aws_subnet.private.*.id
}

output "private_subnets_route_table_id" {
  description = "ID of the Route Table used on Private networks"
  value       = aws_route_table.private.*.id
}
