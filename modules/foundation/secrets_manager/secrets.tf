################################################################################
# FILE DEFINITION : Secrets Manager Secret & Secret Versions (SECRETS_MANAGER)
# PURPOSE         : Stores encrypted application credentials, database passwords, and API keys securely with automated lifecycle protection.
# HOW IT WORKS    : Provisions aws_secretsmanager_secret encrypted by KMS and populates initial secret payloads via aws_secretsmanager_secret_version.
################################################################################

resource "aws_secretsmanager_secret" "this" {
  name                    = var.secret_name
  description             = var.secret_description
  kms_key_id              = var.kms_key_id
  recovery_window_in_days = var.recovery_window_in_days
  tags                    = local.common_tags
}

resource "aws_secretsmanager_secret_version" "this" {
  count         = var.secret_string != null ? 1 : 0
  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = var.secret_string
}
