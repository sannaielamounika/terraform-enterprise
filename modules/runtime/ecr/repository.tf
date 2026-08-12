################################################################################
# FILE DEFINITION : repository.tf for ECR Module Creates the ECR repository
# PURPOSE         : Manages the repository component within the ecr architecture.
# HOW IT WORKS    : Executes declarative Terraform configuration to provision, configure, and manage AWS resources for ecr.
################################################################################

resource "aws_ecr_repository" "repositories" {
  for_each             = toset(var.repository_names)
  name                 = local.prefix_str != "" ? "${local.prefix_str}-${each.value}" : each.value
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = local.common_tags
}
