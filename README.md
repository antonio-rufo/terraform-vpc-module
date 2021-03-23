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

## Inputs

| Name                                             | Description                                                        | Type   | Default | Required |
| ------------------------------------------------ | ------------------------------------------------------------------ | ------ | ------- | :------: |
| availability\_zones                              | List of availability zones to be used by subnets                   | `list` | n/a     |   yes    |
| name\_prefix                                     | Name prefix for resources on AWS                                   | `any`  | n/a     |   yes    |
| private\_subnets\_cidrs\_per\_availability\_zone | List of CIDRs to use on each availability zone for private subnets | `list` | n/a     |   yes    |
| public\_subnets\_cidrs\_per\_availability\_zone  | List of CIDRs to use on each availability zone for public subnets  | `list` | n/a     |   yes    |
| single\_nat                                      | enable single NAT Gateway                                          | `bool` | `false` |    no    |
| vpc\_cidr\_block                                 | AWS VPC CIDR Block                                                 | `any`  | n/a     |   yes    |

## Outputs

| Name                               | Description                                                                                            |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------ |
| availability\_zones                | List of availability zones used by subnets                                                             |
| internet\_gateway\_id              | ID of the generated Internet Gateway                                                                   |
| nat\_gw\_ids                       | List with the IDs of the NAT Gateways created on public subnets to provide internet to private subnets |
| private\_subnets\_ids              | List with the Private Subnets IDs                                                                      |
| private\_subnets\_route\_table\_id | ID of the Route Table used on Private networks                                                         |
| public\_subnets\_ids               | List with the Public Subnets IDs                                                                       |
| public\_subnets\_route\_table\_id  | ID of the Route Tables used on Public networks                                                         |
| vpc\_cidr\_block                   | The CIDR block of the VPC                                                                              |
| vpc\_id                            | The ID of the VPC                                                                                      |