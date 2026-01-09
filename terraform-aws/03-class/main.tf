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
 count = var.vpc_count
  cidr_block = var.vpc_cidrs[count.index]
  tags = {
    Name = "demovpc1"
  }
}

variable "vpc_count" {
  type = number
  default = 2 
}

variable "vpc_cidrs" {
  type = list(string)
  default = [ "10.0.0.0/16","10.1.0.0/16" ]
}