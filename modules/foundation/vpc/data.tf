################################################################################
# FILE DEFINITION : Data Source Lookups (VPC)
# PURPOSE         : Queries dynamic metadata from the target AWS account, active region, availability zones, or TLS certificates.
# HOW IT WORKS    : Executes read-only AWS API calls during the Terraform plan phase to discover account IDs, partitions, and external parameters.
################################################################################

data "aws_availability_zones" "available" { state = "available" }
data "aws_region" "current" {}
