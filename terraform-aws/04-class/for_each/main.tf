terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }
  backend "s3" {
    bucket = "org-terraform-state-prod"
    key = "network/dprod.statefile"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}

provider "aws" {
  # Configuration options
}



resource "aws_vpc" "myvpc1" {
  for_each = {
    dev  = "10.0.0.0/16"
    test = "10.1.0.0/16"
    prod = "10.2.0.0/16"
  }

  cidr_block = each.value
  tags = {
    Name = "vpc-${each.key}"
    Env  = each.key
  }
}