################################################################################
# FILE DEFINITION : Module Output Values (KMS)
# PURPOSE         : Exposes essential resource attributes (IDs, ARNs, endpoints, names) to parent environments and sibling modules.
# HOW IT WORKS    : Extracts computed values from provisioned AWS resources and returns them as typed module outputs for cross-module wiring.
################################################################################

output "key_arn" {
  description = "The Amazon Resource Name (ARN) of the KMS Key"
  value       = aws_kms_key.this.arn
}

output "key_id" {
  description = "The globally unique identifier for the KMS Key"
  value       = aws_kms_key.this.key_id
}

output "alias_arn" {
  description = "The Amazon Resource Name (ARN) of the KMS Key alias"
  value       = aws_kms_alias.this.arn
}

output "alias_name" {
  description = "The display name of the KMS Key alias"
  value       = aws_kms_alias.this.name
}
