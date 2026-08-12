################################################################################
# FILE DEFINITION : OpenID Connect (OIDC) Identity Provider (IAM)
# PURPOSE         : Enables IAM Roles for Service Accounts (IRSA) allowing Kubernetes pods to assume AWS IAM roles securely.
# HOW IT WORKS    : Fetches OIDC issuer TLS thumbprints and registers the aws_iam_openid_connect_provider in AWS IAM.
################################################################################

resource "aws_iam_openid_connect_provider" "this" {
  count           = var.create_oidc_provider && var.oidc_url != null ? 1 : 0
  url             = var.oidc_url
  client_id_list  = var.oidc_client_id_list
  thumbprint_list = [data.tls_certificate.oidc[0].certificates[0].sha1_fingerprint]
  tags            = local.common_tags
}
