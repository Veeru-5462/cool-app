# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}
#Create VPC
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"
  enable_vpn_gateway = var.enable_vpn_gateway
  aws_availability_zone = local.azs
  private_subnets = slice(var.private_subnet_cidr_blocks, 0, var.private_subnet_count)
  public_subnets = slice(var.public_subnet_cidr_blocks, 0, var.public_subnet_count)
  tags = {
    Name = "VPC"
  }
}
