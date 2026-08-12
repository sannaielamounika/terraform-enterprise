output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.networking.private_subnet_ids
}

output "ecr_repository_urls" {
  description = "Map of ECR repository URLs"
  value       = module.ecr.repository_urls
}

output "eks_cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "Endpoint for EKS Kubernetes API server"
  value       = module.eks.cluster_endpoint
}

output "db_endpoint" {
  description = "Connection endpoint for the RDS PostgreSQL database"
  value       = module.rds.db_endpoint
}

output "db_instance_id" {
  description = "Identifier of the RDS instance"
  value       = module.rds.db_instance_id
}
