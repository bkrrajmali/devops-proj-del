resource "aws_subnet" "demosubnet" {
  vpc_id = var.vpc_id
  cidr_block = var.cidr
  availability_zone = var.az
  map_public_ip_on_launch = var.public_ip

  tags = {
    Name = var.name
  }
}