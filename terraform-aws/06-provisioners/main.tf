terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.76.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "example-vpc"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id

  tags = {
    Name = "example-igw"
  }
}

# Create a public subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "example-public-subnet"
  }
}

# Create a Route Table for the VPC
resource "aws_route_table" "example" {
  vpc_id = aws_vpc.example.id

  tags = {
    Name = "example-route-table"
  }
}

# Create a Route for Internet Access
resource "aws_route" "example" {
  route_table_id         = aws_route_table.example.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.example.id
}

# Associate the Route Table with the Subnet
resource "aws_route_table_association" "example" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.example.id
}

# Security Group to Allow SSH
resource "aws_security_group" "example" {
  vpc_id = aws_vpc.example.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict to your IP in production
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example-security-group"
  }
}

# Key Pair for EC2 Instance
resource "aws_key_pair" "example" {
  key_name   = "terraform-key"
  public_key = file(var.public_key_path)
}

# EC2 instance
resource "aws_instance" "example" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  key_name             = aws_key_pair.example.key_name
  vpc_security_group_ids = [aws_security_group.example.id]
  subnet_id           = aws_subnet.public.id

  tags = {
    Name = "TerraformProvisionedInstance"
  }

  # Local provisioner to log the instance public IP to a file
  provisioner "local-exec" {
    command = "echo 'EC2 instance with public IP ${self.public_ip} is up and running' > instance_info.txt"
  }
}
  resource "null_resource" "copy_script" {
  provisioner "file" {
    source      = "remote_script.sh"
    destination = "/tmp/remote_script.sh"

    connection {
      type        = "ssh"
      host        = aws_instance.example.public_ip
      user        = "ec2-user"
      private_key = file(var.private_key_path)
      
    }
    
  }

  # Remote provisioner to execute commands on the instance after creation
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = aws_instance.example.public_ip
      user        = "ec2-user"
      private_key = file(var.private_key_path)
      timeout     = "3m"
    

    }

    inline = [
      "sudo yum update -y", # This can be skipped if no update is required
      "bash /tmp/remote_script.sh"
    ]
  }
depends_on = [ aws_instance.example ]
}
# Copy script to the instance

