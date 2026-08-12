################################################################################
# FILE DEFINITION : KMS Customer Managed Key (KMS)
# PURPOSE         : Provisions hardware-backed AES-256 / symmetric KMS keys for envelope encryption of data at rest.
# HOW IT WORKS    : Calls aws_kms_key with annual key rotation, custom key deletion windows, and attaches key access policies.
################################################################################

resource "aws_kms_key" "this" {
  description                        = var.description
  deletion_window_in_days            = var.deletion_window_in_days
  enable_key_rotation                = var.enable_key_rotation
  policy                             = var.key_policy != null ? var.key_policy : data.aws_iam_policy_document.default_kms_policy.json
  multi_region                       = var.multi_region
  bypass_policy_lockout_safety_check = false
  tags                               = local.common_tags
}
