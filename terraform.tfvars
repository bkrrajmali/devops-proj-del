vpc = {
  cidr = "10.0.0.0/16"
  name = "demo-module-vpc"
}

subnet = {
  cidr = "10.0.1.0/24"
  az = "us-east-1a"
  public_ip = "false"
  name = "demo-subnet"
}