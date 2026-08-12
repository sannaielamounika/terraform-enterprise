################################################################################
# FILE DEFINITION : Data Source Lookups (ECR)
# PURPOSE         : Queries dynamic metadata from the target AWS account, active region, availability zones, or TLS certificates.
# HOW IT WORKS    : Executes read-only AWS API calls during the Terraform plan phase to discover account IDs, partitions, and external parameters.
################################################################################

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
