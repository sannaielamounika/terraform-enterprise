################################################################################
# FILE DEFINITION : S3 Bucket & Public Access Block (S3)
# PURPOSE         : Creates secure S3 object storage with public access prevention to eliminate data exposure risks.
# HOW IT WORKS    : Provisions aws_s3_bucket and enforces aws_s3_bucket_public_access_block with all 4 public access protections enabled.
################################################################################

resource "aws_s3_bucket" "this" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy
  tags          = local.common_tags
}

resource "aws_s3_bucket_public_access_block" "this" {
  count                   = var.block_public_access ? 1 : 0
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
