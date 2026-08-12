variable "project_name" {
  type        = string
  description = "Project name identifier for resource tagging and prefixing"
  default     = "speshway"
}

variable "environment" {
  type        = string
  description = "Target deployment environment"
  default     = "prod"
}

variable "region" {
  type        = string
  description = "AWS region for infrastructure provisioning"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the Virtual Private Cloud"
}

variable "nat_gateway_count" {
  type        = number
  description = "Number of NAT Gateways for private subnet egress"
  default     = 2
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "List of public subnet CIDRs across Availability Zones"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "List of private subnet CIDRs across Availability Zones"
}

variable "enable_vpc_endpoints" {
  type        = bool
  description = "Flag to enable AWS VPC Gateway & Interface endpoints"
  default     = true
}

variable "repository_names" {
  type        = list(string)
  description = "List of ECR repository names to create"
  default     = ["frontend-repo", "backend-repo", "auth-repo", "payment-repo"]
}

variable "node_instance_types" {
  type        = list(string)
  description = "EC2 instance types for EKS worker nodes"
  default     = ["m5.large", "m5.xlarge"]
}

variable "desired_size" {
  type        = number
  description = "Desired number of EKS worker nodes"
  default     = 3
}

variable "min_size" {
  type        = number
  description = "Minimum number of EKS worker nodes"
  default     = 2
}

variable "max_size" {
  type        = number
  description = "Maximum number of EKS worker nodes"
  default     = 10
}

variable "admin_principal_arns" {
  type        = list(string)
  description = "List of IAM ARNs to grant EKS Cluster Admin access"
  default     = [
    "arn:aws:iam::475345973578:root",
    "arn:aws:iam::475345973578:user/mounika"
  ]
}
