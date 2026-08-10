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

module "ecr" {
  source           = "../../modules/runtime/ecr"
  project_name     = var.project_name
  environment      = var.environment
  repository_names = ["frontend-repo", "backend-repo", "auth-repo"]
}

module "eks" {
  source                          = "../../modules/runtime/eks"
  project_name                    = var.project_name
  environment                     = var.environment
  vpc_id                          = module.networking.vpc_id
  subnet_ids                      = concat(module.networking.public_subnet_ids, module.networking.private_subnet_ids)
  private_subnet_ids              = module.networking.private_subnet_ids
  node_instance_types             = ["t3.medium"]
  desired_size                    = 2
  min_size                        = 1
  max_size                        = 4
  enable_load_balancer_controller = true
  enable_metrics_server           = true
  enable_external_dns             = true
  enable_cert_manager             = true
}

module "rds" {
  source                  = "../../modules/runtime/rds"
  project_name            = var.project_name
  environment             = var.environment
  vpc_id                  = module.networking.vpc_id
  subnet_ids              = module.networking.private_subnet_ids
  allowed_security_groups = [module.eks.node_security_group_id]
  engine                  = "postgres"
  engine_version          = "15.4"
  instance_class          = "db.t4g.micro"
  allocated_storage       = 20
  db_name                 = "speshway_qa"
  db_username             = "dbadmin"
  db_password             = var.db_password
  multi_az                = false
}
