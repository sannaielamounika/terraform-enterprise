################################################################################
# FILE DEFINITION : Module Output Values (IAM)
# PURPOSE         : Exposes essential resource attributes (IDs, ARNs, endpoints, names) to parent environments and sibling modules.
# HOW IT WORKS    : Extracts computed values from provisioned AWS resources and returns them as typed module outputs for cross-module wiring.
################################################################################

output "role_arn" {
  description = "The ARN of the IAM Role"
  value       = aws_iam_role.this.arn
}

output "role_name" {
  description = "The Name of the IAM Role"
  value       = aws_iam_role.this.name
}

output "role_id" {
  description = "The unique ID of the IAM Role"
  value       = aws_iam_role.this.id
}

output "instance_profile_arn" {
  description = "The ARN of the IAM Instance Profile (if created)"
  value       = try(aws_iam_instance_profile.this[0].arn, null)
}

output "instance_profile_name" {
  description = "The Name of the IAM Instance Profile (if created)"
  value       = try(aws_iam_instance_profile.this[0].name, null)
}

output "custom_policy_arn" {
  description = "The ARN of the custom policy (if created)"
  value       = try(aws_iam_policy.custom[0].arn, null)
}

output "oidc_provider_arn" {
  description = "The ARN of the OIDC provider (if created)"
  value       = try(aws_iam_openid_connect_provider.this[0].arn, null)
}
