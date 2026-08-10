resource "aws_kms_key" "eks_secrets" {
  description             = "KMS Key for EKS secrets encryption (${local.cluster_name})"
  deletion_window_in_days = 7
  enable_key_rotation     = true
  tags                    = local.common_tags
}

resource "aws_kms_alias" "eks_secrets_alias" {
  name          = "alias/${local.cluster_name}-secrets"
  target_key_id = aws_kms_key.eks_secrets.key_id
}
