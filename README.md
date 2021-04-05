# VPC Module for AWS #

This Terraform module creates the base networking infrastructure on AWS.

## Requirements

| Name      | Version |
| --------- | ------- |
| terraform | >= 0.12 |

## Providers

| Name | Version |
| ---- | ------- |
| aws  | n/a     |

## Usage

```hcl
module "base-network" {
   source         = "github.com/antonio-rufo/terraform-vpc-module"

  name               = "my-vpc"
  vpc_cidr_block     = "10.0.0.0/16"
  tags               = local.tags
  enable_nat_gateway = true

  azs             = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name to be used on all the resources as identifier | `string`  | `""` | no |
| vpc\_cidr\_block | AWS VPC CIDR Block | `string`  | `n/a` | yes |
| azs | A list of availability zones names or ids in the region | `list(string)` | `[]` | yes |
| private\_subnets | List of CIDRs to use on each availability zone for private subnets | `list(any)` | `[]` | yes |
| public\_subnets | List of CIDRs to use on each availability zone for public subnets | `list(any)` | `[]` | yes |
| single\_nat\_gateway | Set to True for single shared NAT Gateway across all of your private networks | `bool` | `false` |    no    |
| enable\_dns\_support | Should be true to enable DNS support in the VPC | `bool` | `true` | no |
| enable\_dns\_hostnames | Should be true to enable DNS hostnames in the VPC | `bool` | `false` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| create\_igw | Creates Internet Gateway for public subnets and the related routes.  | `bool` | `true` | no |
| public\_subnet\_suffix | Suffix to append to public subnets name  | `string` | `public` | no |
| private\_subnet\_suffix | Suffix to append to private subnets name  | `string` | `private` | no |
| map_public\_ip\_on\_launch | Should be false if you do not want to auto-assign public IP on launch  | `bool` | `true` |    no    |
| reuse\_nat\_ips | Should be true if you don't want EIPs to be created for your NAT Gateways and will instead pass them in via the 'external_nat_ip_ids' variable | `bool` | `false` | no |
| external\_nat\_ip\_ids | List of EIP IDs to be assigned to the NAT Gateways (used in combination with reuse_nat_ips) | `list(string)` | `[]` | no |
| one\_nat\_gateway\_per\_az  | Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`.  | `bool` | `false` | no |
| enable\_nat\_gateway | Should be true if you want to provision NAT Gateways for each of your private networks  | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_id | The ID of the VPC |
| vpc\_cidr\_block | The CIDR block of the VPC |
| internet\_gateway\_id | ID of the generated Internet Gateway |
| nat\_gw\_ids | List with the IDs of the NAT Gateways created on public subnets to provide internet to private subnets |
| public\_subnets\_ids | List with the Public Subnets IDs |
| public\_subnets\_route\_table\_id  | ID of the Route Tables used on Public networks |
| private\_subnets\_ids | List with the Private Subnets IDs |
| private\_subnets\_route\_table\_id | ID of the Route Table used on Private networks |
