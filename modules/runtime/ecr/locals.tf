locals {
  prefix_str = join("-", compact([var.project_name, var.environment]))
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Layer       = "Runtime-ECR"
  }
}
