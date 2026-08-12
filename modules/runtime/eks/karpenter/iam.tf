################################################################################
# FILE DEFINITION : iam.tf for KARPENTER Module
# PURPOSE         : Manages the iam component within the karpenter architecture.
# HOW IT WORKS    : Executes declarative Terraform configuration to provision, configure, and manage AWS resources for karpenter.
################################################################################

resource "aws_iam_role" "karpenter_controller" {
  name = "${var.cluster_name}-karpenter-controller"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRoleWithWebIdentity"
      Effect = "Allow"
      Principal = { Federated = var.oidc_provider_arn }
    }]
  })
}
