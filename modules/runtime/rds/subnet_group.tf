resource "aws_db_subnet_group" "this" {
  name        = "${local.name_prefix}-subnet-group"
  description = "Subnet group for RDS DB instance (${local.name_prefix})"
  subnet_ids  = var.subnet_ids
  tags = merge(local.common_tags, { Name = "${local.name_prefix}-subnet-group" })
}
