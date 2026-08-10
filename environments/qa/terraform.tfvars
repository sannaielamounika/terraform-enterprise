project_name         = "speshway"
environment          = "qa"
region               = "ap-south-1"
vpc_cidr             = "10.2.0.0/16"
enable_vpc_endpoints = true
public_subnet_cidrs  = ["10.2.1.0/24", "10.2.2.0/24"]
private_subnet_cidrs = ["10.2.11.0/24"]
nat_gateway_count    = 1
