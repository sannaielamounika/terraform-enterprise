resource "aws_ecr_lifecycle_policy" "policy" {
  for_each   = aws_ecr_repository.repositories
  repository = each.value.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Expire untagged images older than ${var.untagged_image_retention_days} days"
        selection = {
          tagStatus   = "untagged"
          countType   = "sinceImagePushed"
          countUnit   = "days"
          countNumber = var.untagged_image_retention_days
        }
        action = { type = "expire" }
      },
      {
        rulePriority = 2
        description  = "Retain last ${var.tagged_image_max_count} tagged images"
        selection = {
          tagStatus     = "tagged"
          tagPrefixList = ["v", "release", "latest", "build"]
          countType     = "imageCountMoreThan"
          countNumber   = var.tagged_image_max_count
        }
        action = { type = "expire" }
      }
    ]
  })
}
