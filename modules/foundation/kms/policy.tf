################################################################################
# FILE DEFINITION : Access Policy Document (KMS)
# PURPOSE         : Defines least-privilege resource access policies for security compliance and cross-account access.
# HOW IT WORKS    : Generates structured JSON policies using aws_iam_policy_document data sources and attaches them to target AWS resources.
################################################################################

data "aws_iam_policy_document" "default_kms_policy" {
  statement {
    sid       = "Enable IAM User Permissions"
    effect    = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
    actions   = ["kms:*"]
    resources = ["*"]
  }
}
