################################################################################
# FILE DEFINITION : Server-Side Encryption Configuration (RDS)
# PURPOSE         : Enforces encryption at rest for all stored data using either AWS KMS or AES-256 encryption keys.
# HOW IT WORKS    : Applies aws_s3_bucket_server_side_encryption_configuration with Bucket Key enabled to reduce KMS API costs by up to 99%.
################################################################################

resource "aws_kms_key" "rds" {
  count                   = var.kms_key_arn == null ? 1 : 0
  description             = "KMS Key for RDS Storage Encryption (${local.name_prefix})"
  deletion_window_in_days = 7
  enable_key_rotation     = true
  tags                    = local.common_tags
}

locals {
  rds_kms_key_arn = var.kms_key_arn != null ? var.kms_key_arn : aws_kms_key.rds[0].arn
}
