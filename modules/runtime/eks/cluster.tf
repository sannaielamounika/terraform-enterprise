################################################################################
# FILE DEFINITION : EKS Kubernetes Control Plane (EKS) Creates and configures the EKS cluster (control plane). It defines the cluster name, Kubernetes version, IAM role, networking/subnets, lo#ging, and encryption settings. 
# PURPOSE         : Provisions the fully managed, multi-AZ Kubernetes master control plane API server and etcd datastore.
# HOW IT WORKS    : Creates aws_eks_cluster with KMS secrets envelope encryption, private/public endpoint access, and audit logging.
################################################################################

resource "aws_eks_cluster" "this" {
  name     = local.cluster_name
  role_arn = aws_iam_role.cluster_role.arn
  version  = var.cluster_version

  vpc_config {
    subnet_ids              = var.subnet_ids
    security_group_ids      = [aws_security_group.cluster_sg.id]
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

  encryption_config {
    provider { key_arn = aws_kms_key.eks_secrets.arn }
    resources = ["secrets"]
  }

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  depends_on = [
    aws_iam_role_policy_attachment.cluster_amazon_eks_cluster_policy,
    aws_iam_role_policy_attachment.cluster_amazon_eks_vpc_resource_controller,
    aws_cloudwatch_log_group.eks
  ]

  tags = local.common_tags
}
