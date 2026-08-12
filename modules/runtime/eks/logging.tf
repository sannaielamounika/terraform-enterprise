################################################################################
# FILE DEFINITION : logging.tf for EKS Module This means: EKS control-plane logs go to CloudWatch.Logs are retained for 30 days. It creates a place to store/view logs.
# PURPOSE         : Manages the logging component within the eks architecture.
# HOW IT WORKS    : Executes declarative Terraform configuration to provision, configure, and manage AWS resources for eks.
################################################################################

resource "aws_cloudwatch_log_group" "eks" {
  name              = "/aws/eks/${local.cluster_name}/cluster"
  retention_in_days = 30
  tags              = local.common_tags
}

resource "aws_cloudwatch_log_group" "container_insights" {
  name              = "/aws/containerinsights/${local.cluster_name}/application"
  retention_in_days = 14
  tags              = local.common_tags
}
