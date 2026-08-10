output "karpenter_role_arn" { value = aws_iam_role.karpenter_controller.arn }
output "sqs_queue_arn" { value = aws_sqs_queue.karpenter_interruption.arn }
