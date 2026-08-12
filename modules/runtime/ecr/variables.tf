################################################################################
# FILE DEFINITION : Input Variable Declarations (ECR)
# PURPOSE         : Parameterizes the module to make it 100% reusable across different projects, environments (dev, test, prod), and AWS regions.
# HOW IT WORKS    : Declares type-checked input parameters, default values, and validation rules that callers pass via module arguments or tfvars.
################################################################################

variable "project_name" {
  type    = string
  default = ""
}

variable "environment" {
  type    = string
  default = ""
}

variable "repository_names" {
  type    = list(string)
  default = ["app-frontend", "app-backend"]
}

variable "image_tag_mutability" {
  type    = string
  default = "MUTABLE"
}

variable "scan_on_push" {
  type    = bool
  default = true
}

variable "untagged_image_retention_days" {
  type    = number
  default = 14
}

variable "tagged_image_max_count" {
  type    = number
  default = 30
}

variable "allowed_read_principals" {
  type    = list(string)
  default = []
}
