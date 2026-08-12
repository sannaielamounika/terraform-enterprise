project_name         = "speshway"
environment          = "dev"
region               = "us-east-1"
vpc_cidr             = "10.0.0.0/16"
enable_vpc_endpoints = true
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
nat_gateway_count    = 1
repository_names     = ["frontend-repo", "backend-repo", "auth-repo"]
node_instance_types  = ["t3.medium"]
desired_size         = 2
min_size             = 1
max_size             = 4
admin_principal_arns = [
  "arn:aws:iam::475345973578:root",
  "arn:aws:iam::475345973578:user/mounika"
]
db_password          = "SpeshwaySecure2026!"
db_allocated_storage = 20
db_instance_class    = "db.t4g.micro"
