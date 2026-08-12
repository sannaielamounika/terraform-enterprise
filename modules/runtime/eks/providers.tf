################################################################################
# FILE DEFINITION : Provider Configuration (EKS)
# PURPOSE         : Defines local provider requirements and aliases inherited from the parent environment orchestrator.
# HOW IT WORKS    : Consumes AWS, Kubernetes, Helm, or Kubectl credentials configured in the parent calling environment without hardcoded secrets.
################################################################################

provider "helm" {
  kubernetes {
    host                   = aws_eks_cluster.this.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.this.certificate_authority[0].data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.this.name]
      command     = "aws"
    }
  }
}
