terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }
  backend "s3" {
    bucket = "terraformawsbackendconf1"
    key = "network/dprod.statefile"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_instance" "myec2" {
    count =3
  instance_type = var.instance_type
  ami = var.ami_id
  tags = {
    Name = var.Name
    Env =  var.Env
  }
}

