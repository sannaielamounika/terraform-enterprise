################################################################################
# FILE DEFINITION : S3 Bucket Object Versioning (S3)
# PURPOSE         : Protects against accidental overwrites and deletions by preserving multiple historical versions of S3 objects.
# HOW IT WORKS    : Enables aws_s3_bucket_versioning with 'Enabled' status for immutable object audit trails.
################################################################################

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}
