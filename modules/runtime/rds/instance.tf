################################################################################
# FILE DEFINITION : RDS Database Instance (RDS)
# PURPOSE         : Provisions production-grade, managed relational database instances with automated backups and monitoring.
# HOW IT WORKS    : Creates aws_db_instance with encrypted storage, multi-AZ failover, enhanced OS monitoring, and private subnet placement.
################################################################################

resource "aws_db_instance" "this" {
  identifier            = "${local.name_prefix}-db"
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.allocated_storage * 3
  engine                = var.engine
  engine_version        = var.engine_version
  instance_class        = var.instance_class
  db_name               = var.db_name
  username              = var.db_username
  password              = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.this.name
  parameter_group_name   = aws_db_parameter_group.this.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  storage_encrypted      = true
  kms_key_id             = local.rds_kms_key_arn
  multi_az               = var.multi_az

  backup_retention_period = 7
  monitoring_interval     = 60
  monitoring_role_arn     = aws_iam_role.rds_enhanced_monitoring.arn
  skip_final_snapshot     = true
  tags                    = local.common_tags
}
