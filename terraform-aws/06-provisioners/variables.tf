variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0166fe664262f664c" # Amazon Linux 2
}

variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}

variable "public_key_path" {
  description = "Path to your public key file"
  default     = "~/.ssh/id_rsa.pub"
}

variable "private_key_path" {
  description = "Path to your private key file"
  default     = "~/.ssh/id_rsa"
}
