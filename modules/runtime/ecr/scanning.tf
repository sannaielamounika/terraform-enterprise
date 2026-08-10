resource "aws_ecr_registry_scanning_configuration" "configuration" {
  scan_type = "ENHANCED"
  rule {
    scan_frequency = "SCAN_ON_PUSH"
    repository_filter {
      filter      = "*"
      filter_type = "WILDCARD"
    }
  }
}
