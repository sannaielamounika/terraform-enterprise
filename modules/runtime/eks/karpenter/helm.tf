################################################################################
# FILE DEFINITION : Karpenter Helm Controller Deployment (KARPENTER) Installs Karpenter into the EKS cluster using Helm. It defines the Karpenter Helm chart, version, namespace, and configurat#ion values.
# PURPOSE         : Deploys the Karpenter autoscaling controller pod into the Kubernetes cluster via Helm.
# HOW IT WORKS    : Deploys helm_release from AWS public ECR OCI registry and configures cluster name, endpoint, and IRSA role ARN.
################################################################################

resource "helm_release" "karpenter" {
  name             = "karpenter"
  repository       = "oci://public.ecr.aws/karpenter"
  chart            = "karpenter"
  version          = "v0.35.0"
  namespace        = "karpenter"
  create_namespace = true

  set {
    name  = "settings.clusterName"
    value = var.cluster_name
  }

  set {
    name  = "settings.clusterEndpoint"
    value = var.cluster_endpoint
  }
}
