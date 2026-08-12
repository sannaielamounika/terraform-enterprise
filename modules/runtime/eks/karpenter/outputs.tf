################################################################################
# FILE DEFINITION : Module Output Values (KARPENTER)
# PURPOSE         : Exposes essential resource attributes (IDs, ARNs, endpoints, names) to parent environments and sibling modules.
# HOW IT WORKS    : Extracts computed values from provisioned AWS resources and returns them as typed module outputs for cross-module wiring.
################################################################################

output "karpenter_role_arn" { value = aws_iam_role.karpenter_controller.arn }
output "sqs_queue_arn" { value = aws_sqs_queue.karpenter_interruption.arn }
