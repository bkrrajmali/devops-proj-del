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

resource "aws_vpc" "myvpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "demovpc"
  }
#   lifecycle {
#     create_before_destroy = true
#   }
# lifecycle {
#   prevent_destroy = true
# }
lifecycle {
  ignore_changes = [ tags ]
}
}
