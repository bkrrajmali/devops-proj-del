terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_vpc" "myvpc1" {
  count      = 3
  cidr_block = "10.${10+count.index}.0.0/16"
  tags = {
    Name = "vpc-${count.index}"
  }
}