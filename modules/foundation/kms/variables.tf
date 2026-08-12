################################################################################
# FILE DEFINITION : Input Variable Declarations (KMS)
# PURPOSE         : Parameterizes the module to make it 100% reusable across different projects, environments (dev, test, prod), and AWS regions.
# HOW IT WORKS    : Declares type-checked input parameters, default values, and validation rules that callers pass via module arguments or tfvars.
################################################################################

variable "project_name" {
  type        = string
  description = "Project identifier for resource prefixing and tagging"
  default     = "speshway"
}

variable "environment" {
  type        = string
  description = "Target deployment environment"
  default     = "dev"
}

variable "description" {
  type        = string
  description = "Description of the KMS Customer Managed Key"
  default     = "Enterprise Customer Managed Key"
}

variable "deletion_window_in_days" {
  type        = number
  description = "Waiting period in days before key deletion (7-30 days)"
  default     = 30
}

variable "enable_key_rotation" {
  type        = bool
  description = "Enable automatic annual KMS key rotation"
  default     = true
}

variable "alias_name" {
  type        = string
  description = "Display alias for the key (e.g., alias/my-app-key)"
  default     = null
}

variable "key_policy" {
  type        = string
  description = "Custom JSON policy document to attach to the KMS key"
  default     = null
}

variable "multi_region" {
  type        = bool
  description = "Flag to declare key as a Multi-Region primary key"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the KMS key and alias"
  default     = {}
}
