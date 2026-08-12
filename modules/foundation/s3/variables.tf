################################################################################
# FILE DEFINITION : Input Variable Declarations (S3)
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

variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "force_destroy" {
  type        = bool
  description = "Allow deletion of all objects upon bucket destruction"
  default     = false
}

variable "enable_versioning" {
  type        = bool
  description = "Enable object versioning for data protection"
  default     = true
}

variable "enable_kms_encryption" {
  type        = bool
  description = "Encrypt bucket objects using AWS KMS instead of AES256"
  default     = true
}

variable "kms_master_key_id" {
  type        = string
  description = "KMS Key ARN or ID to use for server-side encryption"
  default     = null
}

variable "block_public_access" {
  type        = bool
  description = "Enable S3 Block Public Access settings"
  default     = true
}

variable "attach_policy" {
  type        = bool
  description = "Attach custom bucket policy"
  default     = false
}

variable "policy" {
  type        = string
  description = "Custom JSON bucket policy"
  default     = null
}

variable "lifecycle_rules" {
  type = list(object({
    id                                 = string
    enabled                            = bool
    transition_days                    = optional(number)
    transition_storage_class           = optional(string, "STANDARD_IA")
    noncurrent_version_transition_days = optional(number)
    noncurrent_version_storage_class   = optional(string, "GLACIER")
    noncurrent_version_expiration_days = optional(number)
    expiration_days                    = optional(number)
  }))
  description = "Lifecycle rules for object archiving and expiration"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the S3 bucket"
  default     = {}
}
