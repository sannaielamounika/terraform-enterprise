variable "project_name" {
  type    = string
  default = "speshway"
}

variable "environment" {
  type    = string
  default = "qa"
}

variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_cidr" {
  type = string
}

variable "nat_gateway_count" {
  type = number
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "enable_vpc_endpoints" {
  type    = bool
  default = true
}

variable "db_password" {
  type    = string
  default = "SecurePass123!"
}
