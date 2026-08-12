################################################################################
# FILE DEFINITION : Access Policy Document (ECR) This controls who/what can access the ECR repository. it controls actions such as pull image, push image, get image, deleteimage list image
# PURPOSE         : Defines least-privilege resource access policies for security compliance and cross-account access.
# HOW IT WORKS    : Generates structured JSON policies using aws_iam_policy_document data sources and attaches them to target AWS resources.
################################################################################

resource "aws_ecr_repository_policy" "policy" {
  for_each   = length(var.allowed_read_principals) > 0 ? aws_ecr_repository.repositories : {}
  repository = each.value.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowPullAccess"
        Effect = "Allow"
        Principal = { AWS = var.allowed_read_principals }
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage"
        ]
      }
    ]
  })
}
