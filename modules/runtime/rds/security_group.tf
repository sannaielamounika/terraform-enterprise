################################################################################
# FILE DEFINITION : security_group.tf for RDS Module
# PURPOSE         : Manages the security_group component within the rds architecture.
# HOW IT WORKS    : Executes declarative Terraform configuration to provision, configure, and manage AWS resources for rds.
################################################################################

resource "aws_security_group" "rds" {
  name        = "${local.name_prefix}-rds-sg"
  description = "Security Group for RDS Instance"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = length(var.allowed_security_groups) > 0 ? var.allowed_security_groups : []
    content {
      description     = "Database ingress from allowed security group"
      from_port       = local.db_port
      to_port         = local.db_port
      protocol        = "tcp"
      security_groups = [ingress.value]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, { Name = "${local.name_prefix}-rds-sg" })
}
