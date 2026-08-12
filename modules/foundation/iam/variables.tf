################################################################################
# FILE DEFINITION : Input Variable Declarations (IAM)
# PURPOSE         : Parameterizes the module to make it 100% reusable across different projects, environments (dev, test, prod), and AWS regions.
# HOW IT WORKS    : Declares type-checked input parameters, default values, and validation rules that callers pass via module arguments or tfvars.
################################################################################

variable "project_name" {
  type        = string
  description = "Project name identifier for resource tagging and naming"
  default     = "speshway"
}

variable "environment" {
  type        = string
  description = "Target deployment environment (e.g. dev, test, prod)"
  default     = "dev"
}

variable "role_name" {
  type        = string
  description = "Name of the IAM Role to create"
}

variable "role_description" {
  type        = string
  description = "Description of the IAM Role"
  default     = "Enterprise Reusable IAM Role"
}

variable "trusted_services" {
  type        = list(string)
  description = "List of AWS service principals allowed to assume this role (e.g. ec2.amazonaws.com, lambda.amazonaws.com)"
  default     = ["ec2.amazonaws.com"]
}

variable "trusted_role_arns" {
  type        = list(string)
  description = "List of IAM ARNs / Federations allowed to assume this role"
  default     = []
}

variable "custom_assume_role_policy" {
  type        = string
  description = "Override complete trust policy JSON document"
  default     = null
}

variable "create_oidc_provider" {
  type        = bool
  description = "Flag to create an IAM OpenID Connect provider"
  default     = false
}

variable "oidc_url" {
  type        = string
  description = "The URL of the identity provider for OIDC"
  default     = null
}

variable "oidc_client_id_list" {
  type        = list(string)
  description = "List of client IDs (audiences) that can authenticate with OIDC"
  default     = ["sts.amazonaws.com"]
}

variable "managed_policy_arns" {
  type        = list(string)
  description = "List of AWS managed policy ARNs to attach to the role"
  default     = []
}

variable "custom_policy_document" {
  type        = string
  description = "JSON document for an inline / custom policy to attach"
  default     = null
}

variable "custom_policy_name" {
  type        = string
  description = "Name for the custom policy"
  default     = null
}

variable "create_instance_profile" {
  type        = bool
  description = "Create an IAM instance profile associated with this role"
  default     = false
}

variable "max_session_duration" {
  type        = number
  description = "Maximum session duration in seconds (3600 - 43200)"
  default     = 3600
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the IAM resources"
  default     = {}
}
