################################################################################
# FILE DEFINITION : Input Variable Declarations (KARPENTER)
# PURPOSE         : Parameterizes the module to make it 100% reusable across different projects, environments (dev, test, prod), and AWS regions.
# HOW IT WORKS    : Declares type-checked input parameters, default values, and validation rules that callers pass via module arguments or tfvars.
################################################################################

variable "cluster_name" {
  type = string
}

variable "cluster_endpoint" {
  type = string
}

variable "oidc_provider_arn" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
