################################################################################
# FILE DEFINITION : IAM Policies & Role Attachments (IAM)
# PURPOSE         : Defines permission boundaries and attaches AWS managed or customer-managed policies to execution roles.
# HOW IT WORKS    : Creates aws_iam_policy from JSON documents and executes aws_iam_role_policy_attachment to link permissions directly to roles.
################################################################################

resource "aws_iam_role_policy_attachment" "managed" {
  for_each   = toset(var.managed_policy_arns)
  role       = aws_iam_role.this.name
  policy_arn = each.value
}

resource "aws_iam_policy" "custom" {
  count       = var.custom_policy_document != null ? 1 : 0
  name        = var.custom_policy_name != null ? var.custom_policy_name : "${var.role_name}-custom-policy"
  description = "Custom policy attached to ${var.role_name}"
  policy      = var.custom_policy_document
  tags        = local.common_tags
}

resource "aws_iam_role_policy_attachment" "custom" {
  count      = var.custom_policy_document != null ? 1 : 0
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.custom[0].arn
}
