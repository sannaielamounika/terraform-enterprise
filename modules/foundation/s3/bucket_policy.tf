################################################################################
# FILE DEFINITION : S3 Resource-Based Bucket Policy (S3)
# PURPOSE         : Enforces HTTPS-only transport, cross-account permissions, and IP/VPC endpoint restrictions on S3 buckets.
# HOW IT WORKS    : Applies aws_s3_bucket_policy to the target S3 bucket using strict conditional statements in JSON.
################################################################################

resource "aws_s3_bucket_policy" "this" {
  count  = var.attach_policy && var.policy != null ? 1 : 0
  bucket = aws_s3_bucket.this.id
  policy = var.policy
}
