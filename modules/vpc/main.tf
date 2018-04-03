provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc"

  name = "pcompany-vpc-east"

  cidr = "172.31.0.0/16"

  azs                 = ["us-east-1a", "us-east-1b", "us-aest-1c"]
  private_subnets     = ["172.31.1.0/24", "172.31.2.0/24", "172.31.3.0/24"]
  public_subnets      = ["172.31.11.0/24", "172.31.12.0/24", "172.31.13.0/24"]
  database_subnets    = ["172.31.21.0/24", "172.31.22.0/24", "172.31.23.0/24"]
  elasticache_subnets = ["172.31.31.0/24", "172.31.32.0/24", "172.31.33.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true
  enable_s3_endpoint = true

  tags = {
    Owner       = "pcompany"
    Environment = "staging"
    Name        = "vpc1"
  }
}
