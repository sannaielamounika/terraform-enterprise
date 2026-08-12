################################################################################
# FILE DEFINITION : IAM Roles & Instance Profiles (IAM)
# PURPOSE         : Defines secure IAM execution roles and instance profiles adhering to the Principle of Least Privilege.
# HOW IT WORKS    : Creates aws_iam_role with dynamic trust relationships (assume role policies) and binds instance profiles for compute attachment.
################################################################################

resource "aws_iam_role" "this" {
  name                 = var.role_name
  description          = var.role_description
  assume_role_policy   = var.custom_assume_role_policy != null ? var.custom_assume_role_policy : data.aws_iam_policy_document.default_trust.json
  max_session_duration = var.max_session_duration
  tags                 = local.common_tags
}

resource "aws_iam_instance_profile" "this" {
  count = var.create_instance_profile ? 1 : 0
  name  = "${var.role_name}-instance-profile"
  role  = aws_iam_role.this.name
  tags  = local.common_tags
}
