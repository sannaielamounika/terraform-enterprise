locals {
  name_prefix = "${var.project_name}-${var.environment}"
  db_port     = var.engine == "postgres" ? 5432 : 3306
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Layer       = "Runtime-RDS"
  }
}
