
# terraform-aws-vpc

## Overview

This Terraform module creates an AWS VPC with a given CIDR block. It also creates multiple subnets (public and private), and for public subnets, it sets up an Internet Gateway (IGW) and appropriate route tables.

## Features

- Creates a VPC with a specified CIDR block
- Creates public and private subnets
- Creates an Internet Gateway (IGW) for public subnets
- Sets up route tables for public subnets

## Usage
```

module "VPC" {
  source         = "./modules/VPC"  # Source-File-Path
  VPC_cidr_block = "10.0.0.0/16"    
  subnet = {
    "subnet1" = {
      Subnet_cidr_block = "10.0.0.0/24"
      Public_subnet     = "true"    # true = Public
    }
    "subnet2" = {
      Subnet_cidr_block = "10.0.1.0/24"
      Public_subnet     = "false"   # false = Private
    }
  }
}


```
 