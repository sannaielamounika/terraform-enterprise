################################################################################
# FILE DEFINITION : Secrets Manager Resource Policy (SECRETS_MANAGER)
# PURPOSE         : Restricts secret decryption access to authorized IAM roles and VPC endpoints while blocking public access.
# HOW IT WORKS    : Attaches aws_secretsmanager_secret_policy to the secret with block_public_policy set to true.
################################################################################

resource "aws_secretsmanager_secret_policy" "this" {
  count               = var.attach_resource_policy && var.resource_policy != null ? 1 : 0
  secret_arn          = aws_secretsmanager_secret.this.arn
  policy              = var.resource_policy
  block_public_policy = true
}
