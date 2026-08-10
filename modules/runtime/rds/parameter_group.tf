resource "aws_db_parameter_group" "this" {
  name        = "${local.name_prefix}-params"
  family      = "${var.engine}${split(".", var.engine_version)[0]}"
  description = "Custom parameter group for ${local.name_prefix}"

  parameter {
    name  = var.engine == "postgres" ? "rds.force_ssl" : "require_secure_transport"
    value = "1"
  }

  tags = local.common_tags
}
