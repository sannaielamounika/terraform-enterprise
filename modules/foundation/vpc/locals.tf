################################################################################
# FILE DEFINITION : Local Computed Values & Tagging (VPC)
# PURPOSE         : Computes reusable intermediate expressions, naming conventions, and standard tagging dictionaries across the module.
# HOW IT WORKS    : Calculates strings (e.g. name_prefix) and merges resource tags before passing them down to individual AWS resource blocks.
################################################################################

locals {
  name_prefix = "${var.project_name}-${var.environment}"
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Layer       = "Foundation-VPC"
  }
}
