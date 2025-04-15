variable "VPC_cidr_block" {
  description = "CIDR Block of VPC"
  type        = string
}

locals {
  tags = "My-Project-Module"
}


variable "subnet" {
  type = map(object({
    Subnet_cidr_block = string
    Public_subnet     = string
  }))
  # default = {
  #   "subnet1" = {
  #     Subnet_cidr_block = "10.0.0.0/24"
  #     Private_subnet = "true"
  #   }
  #   "subnet2" = {
  #       Subnet_cidr_block = "10.0.1.0/24"
  #       Private_subnet = false
  #   }
  #   "subnet3" = {
  #       Subnet_cidr_block = "10.0.2.0/24"
  #       Private_subnet = "true"
  #   }
  # }

}

locals {
  Public_subnet = {
    for i, j in aws_subnet.name :
    i => j.id
    if lookup(j.tags, "Public_subnet") == "true"
  }
}


output "value" {
  value = local.Public_subnet
}
