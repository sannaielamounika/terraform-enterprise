################################################################################
# FILE DEFINITION : scanning.tf for ECR Module It tells ECR to scan Docker images for known vulnerabilities.
# PURPOSE         : Manages the scanning component within the ecr architecture. 
# HOW IT WORKS    : Executes declarative Terraform configuration to provision, configure, and manage AWS resources for ecr.
################################################################################

resource "aws_ecr_registry_scanning_configuration" "configuration" {
  scan_type = "ENHANCED"
  rule {
    scan_frequency = "SCAN_ON_PUSH"
    repository_filter {
      filter      = "*"
      filter_type = "WILDCARD"
    }
  }
}
