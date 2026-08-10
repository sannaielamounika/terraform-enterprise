# 1. Foundation VPC (Multi-AZ High-Availability Network Layer)
module "networking" {
  source               = "../../modules/foundation/vpc"
  region               = var.region
  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  nat_gateway_count    = var.nat_gateway_count
  enable_vpc_endpoints = var.enable_vpc_endpoints
}

# 2. Runtime ECR (Docker Container Registries)
module "ecr" {
  source           = "../../modules/foundation/runtime/ecr"
  project_name     = var.project_name
  environment      = var.environment
  repository_names = var.repository_names
}

# 3. Runtime EKS (Kubernetes 1.30 Production Cluster)
module "eks" {
  source                          = "../../modules/foundation/runtime/eks"
  project_name                    = var.project_name
  environment                     = var.environment
  vpc_id                          = module.networking.vpc_id
  subnet_ids                      = concat(module.networking.public_subnet_ids, module.networking.private_subnet_ids)
  private_subnet_ids              = module.networking.private_subnet_ids
  node_instance_types             = var.node_instance_types
  desired_size                    = var.desired_size
  min_size                        = var.min_size
  max_size                        = var.max_size
  enable_load_balancer_controller = true
  enable_metrics_server           = true
  enable_external_dns             = true
  enable_cert_manager             = true
}
