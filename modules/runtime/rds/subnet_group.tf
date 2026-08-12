################################################################################
# FILE DEFINITION : subnet_group.tf for RDS Module
# PURPOSE         : Manages the subnet_group component within the rds architecture.
# HOW IT WORKS    : Executes declarative Terraform configuration to provision, configure, and manage AWS resources for rds.
################################################################################

resource "aws_db_subnet_group" "this" {
  name        = "${local.name_prefix}-subnet-group"
  description = "Subnet group for RDS DB instance (${local.name_prefix})"
  subnet_ids  = var.subnet_ids
  tags = merge(local.common_tags, { Name = "${local.name_prefix}-subnet-group" })
}
