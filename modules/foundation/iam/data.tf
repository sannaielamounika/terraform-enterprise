################################################################################
# FILE DEFINITION : Data Source Lookups (IAM)
# PURPOSE         : Queries dynamic metadata from the target AWS account, active region, availability zones, or TLS certificates.
# HOW IT WORKS    : Executes read-only AWS API calls during the Terraform plan phase to discover account IDs, partitions, and external parameters.
################################################################################

data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}

data "tls_certificate" "oidc" {
  count = var.create_oidc_provider && var.oidc_url != null ? 1 : 0
  url   = var.oidc_url
}

data "aws_iam_policy_document" "default_trust" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    dynamic "principals" {
      for_each = length(var.trusted_services) > 0 ? [1] : []
      content {
        type        = "Service"
        identifiers = var.trusted_services
      }
    }

    dynamic "principals" {
      for_each = length(var.trusted_role_arns) > 0 ? [1] : []
      content {
        type        = "AWS"
        identifiers = var.trusted_role_arns
      }
    }
  }
}
