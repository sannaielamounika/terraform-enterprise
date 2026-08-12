resource "aws_kms_key" "state_key" {
  description             = "KMS Key for Terraform State S3 Bucket Encryption"
  deletion_window_in_days = 30
  enable_key_rotation     = true
  tags                    = local.common_tags
}

resource "aws_kms_alias" "state_key_alias" {
  name          = "alias/${local.name_prefix}-state-key"
  target_key_id = aws_kms_key.state_key.key_id
}
