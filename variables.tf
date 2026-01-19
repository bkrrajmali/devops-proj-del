variable "vpc" {
  type = object({
    cidr = string
    name = string
  })
}

variable "subnet" {
  type = object({
    cidr = string
    az = string
    public_ip = string
    name = string
  })
}