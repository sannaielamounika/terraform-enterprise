################################################################################
# FILE DEFINITION : Input Variable Declarations (VPC)
# PURPOSE         : Parameterizes the module to make it 100% reusable across different projects, environments (dev, test, prod), and AWS regions.
# HOW IT WORKS    : Declares type-checked input parameters, default values, and validation rules that callers pass via module arguments or tfvars.
################################################################################

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "nat_gateway_count" {
  type    = number
  default = 1
}

variable "enable_vpc_endpoints" {
  type    = bool
  default = true
}
