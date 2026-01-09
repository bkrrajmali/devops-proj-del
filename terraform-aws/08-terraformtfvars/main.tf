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

resource "aws_instance" "myec2" {
  instance_type = var.instance_type
  ami = var.ami_id
  tags = {
    Name = var.Name
    Env =  var.Env
  }
}

