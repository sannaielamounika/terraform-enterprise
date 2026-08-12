################################################################################
# FILE DEFINITION : Module Output Values (ECR)
# PURPOSE         : Exposes essential resource attributes (IDs, ARNs, endpoints, names) to parent environments and sibling modules.
# HOW IT WORKS    : Extracts computed values from provisioned AWS resources and returns them as typed module outputs for cross-module wiring.
################################################################################

output "repository_urls" { value = { for k, v in aws_ecr_repository.repositories : k => v.repository_url } }
output "repository_arns" { value = { for k, v in aws_ecr_repository.repositories : k => v.arn } }
