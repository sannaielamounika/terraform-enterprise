################################################################################
# FILE DEFINITION : OpenID Connect (OIDC) Identity Provider (EKS) Creates the IAM OIDC identity provider for the EKS cluster. It allows Kubernetes service accounts to obtain AWS IAM permission
# PURPOSE         : Enables IAM Roles for Service Accounts (IRSA) allowing Kubernetes pods to assume AWS IAM roles securely.
# HOW IT WORKS    : Fetches OIDC issuer TLS thumbprints and registers the aws_iam_openid_connect_provider in AWS IAM.
################################################################################

data "tls_certificate" "eks" {
  url = aws_eks_cluster.this.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "this" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.this.identity[0].oidc[0].issuer
  tags            = local.common_tags
}
