################################################################################
# FILE DEFINITION : Local Computed Values & Tagging (EKS) Defines reusable local values. It helps avoid repeating values such as cluster names, common tags, and environment names.
# PURPOSE         : Computes reusable intermediate expressions, naming conventions, and standard tagging dictionaries across the module.
# HOW IT WORKS    : Calculates strings (e.g. name_prefix) and merges resource tags before passing them down to individual AWS resource blocks.
################################################################################

locals {
  raw_prefix   = compact([var.project_name, var.environment])
  cluster_name = length(local.raw_prefix) > 0 ? "${join("-", local.raw_prefix)}-eks" : "eks-cluster"

  common_tags = merge(
    {
      Project     = var.project_name != "" ? var.project_name : "default"
      Environment = var.environment != "" ? var.environment : "default"
      ManagedBy   = "Terraform"
      Layer       = "Runtime-EKS"
    },
    var.tags
  )
}
