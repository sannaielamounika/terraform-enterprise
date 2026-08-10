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
