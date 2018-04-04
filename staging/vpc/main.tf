provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc"

  name = "pcompany-vpc-east"

  cidr = "172.32.0.0/16"

  azs                 = ["us-east-1a", "us-east-1b", "us-aest-1c"]
  private_subnets     = ["172.32.1.0/24", "172.32.2.0/24", "172.32.3.0/24"]
  public_subnets      = ["172.32.11.0/24", "172.32.12.0/24", "172.32.13.0/24"]
  database_subnets    = ["172.32.21.0/24", "172.32.22.0/24", "172.32.23.0/24"]
  elasticache_subnets = ["172.32.31.0/24", "172.32.32.0/24", "172.32.33.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true
  enable_s3_endpoint = true

  tags = {
    Owner       = "pcompany"
    Environment = "staging"
    Name        = "vpc1"
  }
}
