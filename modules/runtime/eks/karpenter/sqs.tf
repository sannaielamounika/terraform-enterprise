################################################################################
# FILE DEFINITION : Karpenter SQS Interruption Queue (KARPENTER) Creates the SQS queue used for Karpenter interruption handling. It helps Karpenter react to events such as EC2 Spot interruptio
# PURPOSE         : Receives AWS EventBridge notifications for Spot Interruption and Instance Rebalance events to enable zero-downtime draining.
# HOW IT WORKS    : Creates aws_sqs_queue and subscribes it to EventBridge rules to notify the Karpenter controller before instance termination.
################################################################################

resource "aws_sqs_queue" "karpenter_interruption" {
  name                      = "${var.cluster_name}-karpenter-interruption"
  message_retention_seconds = 300
  sqs_managed_sse_enabled   = true
}
