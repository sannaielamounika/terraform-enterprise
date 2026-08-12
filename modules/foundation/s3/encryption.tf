################################################################################
# FILE DEFINITION : Server-Side Encryption Configuration (S3)
# PURPOSE         : Enforces encryption at rest for all stored data using either AWS KMS or AES-256 encryption keys.
# HOW IT WORKS    : Applies aws_s3_bucket_server_side_encryption_configuration with Bucket Key enabled to reduce KMS API costs by up to 99%.
################################################################################

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.enable_kms_encryption ? "aws:kms" : "AES256"
      kms_master_key_id = var.enable_kms_encryption ? var.kms_master_key_id : null
    }
    bucket_key_enabled = var.enable_kms_encryption ? true : false
  }
}
