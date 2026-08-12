################################################################################
# FILE DEFINITION : S3 Storage Tier Lifecycle Rules (S3)
# PURPOSE         : Optimizes cloud storage costs by transitioning aging data to Standard-IA/Glacier and expiring noncurrent versions.
# HOW IT WORKS    : Configures aws_s3_bucket_lifecycle_configuration with dynamic transition rules and expiration schedules.
################################################################################

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  count  = length(var.lifecycle_rules) > 0 ? 1 : 0
  bucket = aws_s3_bucket.this.id

  dynamic "rule" {
    for_each = var.lifecycle_rules
    content {
      id     = rule.value.id
      status = rule.value.enabled ? "Enabled" : "Disabled"

      dynamic "transition" {
        for_each = rule.value.transition_days != null ? [1] : []
        content {
          days          = rule.value.transition_days
          storage_class = rule.value.transition_storage_class
        }
      }

      dynamic "noncurrent_version_transition" {
        for_each = rule.value.noncurrent_version_transition_days != null ? [1] : []
        content {
          noncurrent_days = rule.value.noncurrent_version_transition_days
          storage_class   = rule.value.noncurrent_version_storage_class
        }
      }

      dynamic "noncurrent_version_expiration" {
        for_each = rule.value.noncurrent_version_expiration_days != null ? [1] : []
        content {
          noncurrent_days = rule.value.noncurrent_version_expiration_days
        }
      }

      dynamic "expiration" {
        for_each = rule.value.expiration_days != null ? [1] : []
        content {
          days = rule.value.expiration_days
        }
      }
    }
  }
}
