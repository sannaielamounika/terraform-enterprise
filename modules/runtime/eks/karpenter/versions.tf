################################################################################
# FILE DEFINITION : Terraform & Provider Version Constraints (KARPENTER)
# PURPOSE         : Enforces minimum Terraform core engine version and locks required AWS/community provider plugins for reproducibility.
# HOW IT WORKS    : Evaluates required_version and required_providers blocks during 'terraform init' to download compatible provider binaries.
################################################################################

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.10"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
  }
}
