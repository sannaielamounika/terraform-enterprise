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
