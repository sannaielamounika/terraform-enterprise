################################################################################
# FILE DEFINITION : Input Variable Declarations (SECRETS_MANAGER)
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

variable "secret_name" {
  type        = string
  description = "Name of the secret in AWS Secrets Manager"
}

variable "secret_description" {
  type        = string
  description = "Description of the secret purpose"
  default     = "Application credential stored in Secrets Manager"
}

variable "kms_key_id" {
  type        = string
  description = "KMS Key ARN or ID to encrypt the secret (defaults to AWS default key if null)"
  default     = null
}

variable "recovery_window_in_days" {
  type        = number
  description = "Number of days that Secrets Manager waits before deleting the secret (0 for force deletion, 7-30 for soft)"
  default     = 7
}

variable "secret_string" {
  type        = string
  description = "Secret value string (e.g. JSON or plaintext)"
  sensitive   = true
  default     = null
}

variable "attach_resource_policy" {
  type        = bool
  description = "Attach a custom resource-based access policy to the secret"
  default     = false
}

variable "resource_policy" {
  type        = string
  description = "JSON document representing the resource policy for the secret"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the secret"
  default     = {}
}
