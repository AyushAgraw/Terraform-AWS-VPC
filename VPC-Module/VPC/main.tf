terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "name" {
  cidr_block = var.VPC_cidr_block
  tags = {
    Name = "${local.tags}-VPC"
  }
}

resource "aws_subnet" "name" {
  for_each          = var.subnet
  vpc_id            = aws_vpc.name.id
  cidr_block        = each.value.Subnet_cidr_block
   tags = {
    Name            = "${local.tags}-${each.key}"
    "Public_subnet" = each.value.Public_subnet
  }
}

resource "aws_internet_gateway" "name" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name = "${local.tags}-VPC-IGW"
  }
}


resource "aws_route_table" "name" {
  vpc_id = aws_vpc.name.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
  }
  tags = {
    Name = "${local.tags}-route-table"
  }
}



resource "aws_route_table_association" "name" {
  for_each       = local.Public_subnet
  route_table_id = aws_route_table.name.id
  subnet_id      = each.value
}
