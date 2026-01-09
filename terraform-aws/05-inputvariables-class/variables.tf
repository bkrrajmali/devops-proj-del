variable "ec2_ami_id" {
  description = "AMI-ID"
  type = string
  default = "ami-0ecb62995f68bb549"
}

variable "instance_type" {
  description = "Instance-Type"
  type = string
  default = "t2.micro"
}