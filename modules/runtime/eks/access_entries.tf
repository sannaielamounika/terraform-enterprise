################################################################################
# FILE DEFINITION : EKS Access Entries & IAM Auth (EKS) Controls which AWS IAM users or roles can access the EKS cluster. It is used for EKS authentication and access permissions.
# PURPOSE         : Grants fine-grained Kubernetes RBAC access to IAM users, roles, and administrators without editing aws-auth configmaps.
# HOW IT WORKS    : Creates aws_eks_access_entry and associates aws_eks_access_policy_association (AmazonEKSClusterAdminPolicy) to principals.
################################################################################

resource "aws_eks_access_entry" "admin" {
  for_each      = toset(var.admin_principal_arns)
  cluster_name  = aws_eks_cluster.this.name
  principal_arn = each.value
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "admin" {
  for_each      = toset(var.admin_principal_arns)
  cluster_name  = aws_eks_cluster.this.name
  principal_arn = each.value
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  access_scope { type = "cluster" }
}
