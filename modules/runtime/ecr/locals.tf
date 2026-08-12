################################################################################
# FILE DEFINITION : Local Computed Values & Tagging (ECR)
# PURPOSE         : Computes reusable intermediate expressions, naming conventions, and standard tagging dictionaries across the module.
# HOW IT WORKS    : Calculates strings (e.g. name_prefix) and merges resource tags before passing them down to individual AWS resource blocks.
################################################################################

locals {
  prefix_str = join("-", compact([var.project_name, var.environment]))
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Layer       = "Runtime-ECR"
  }
}
