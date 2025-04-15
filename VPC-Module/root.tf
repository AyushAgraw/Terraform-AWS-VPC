module "VPC" {
  source         = "./modules/VPC"
  VPC_cidr_block = "10.0.0.0/16"
  subnet = {
    "subnet1" = {
      Subnet_cidr_block = "10.0.0.0/24"
      Public_subnet     = "true"
    }
    "subnet2" = {
      Subnet_cidr_block = "10.0.1.0/24"
      Public_subnet     = "false"
    }
    "subnet3" = {
      Subnet_cidr_block = "10.0.2.0/24"
      Public_subnet     = "true"
    }
    "subnet4" = {
      Subnet_cidr_block = "10.0.3.0/24"
      Public_subnet     = "false"
    }
  }
}

