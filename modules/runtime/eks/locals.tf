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
