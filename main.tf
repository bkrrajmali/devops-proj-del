module "vpc" {
  source = "./modules/vpc"
  cidr = var.vpc.cidr
  name = var.vpc.name
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.id
  cidr =  var.subnet.cidr
  az = var.subnet.az
  public_ip = var.subnet.public_ip
  name = var.subnet.name
}