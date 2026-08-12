project_name         = "speshway"
environment          = "prod"
region               = "us-east-1"
vpc_cidr             = "10.1.0.0/16"
enable_vpc_endpoints = true
public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnet_cidrs = ["10.1.11.0/24", "10.1.12.0/24"]
nat_gateway_count    = 2
repository_names     = ["frontend-repo", "backend-repo", "auth-repo", "payment-repo"]
node_instance_types  = ["m5.large", "m5.xlarge"]
desired_size         = 3
min_size             = 2
max_size             = 10
admin_principal_arns = [
  "arn:aws:iam::475345973578:root",
  "arn:aws:iam::475345973578:user/mounika"
]
