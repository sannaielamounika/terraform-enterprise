################################################################################
# FILE DEFINITION : Karpenter EC2NodeClass (KARPENTER) Defines how Karpenter should create EC2 instances. It specifies things such as AMI family, subnet/security-group selection, IAM instance #profile, and EC2-related settings.
# PURPOSE         : Declares AWS EC2 compute templates, AMI selection, subnet discovery,
#                   security group selectors, and instance role for Karpenter-launched nodes.
# HOW IT WORKS    : Deploys the Kubernetes Custom Resource (CR) 'EC2NodeClass' (karpenter.k8s.aws/v1beta1)
#                   via kubectl_manifest. The Karpenter controller uses this configuration
#                   to provision EC2 instances in AWS matching the subnet and security group tags.
################################################################################

resource "kubectl_manifest" "karpenter_node_class" {
  depends_on = [helm_release.karpenter]

  yaml_body = <<-YAML
    apiVersion: karpenter.k8s.aws/v1beta1
    kind: EC2NodeClass
    metadata:
      name: default
    spec:
      amiFamily: AL2023
      role: ${aws_iam_role.karpenter_node.name}
      subnetSelectorTerms:
        - tags:
            karpenter.sh/discovery: ${var.cluster_name}
      securityGroupSelectorTerms:
        - tags:
            karpenter.sh/discovery: ${var.cluster_name}
      tags:
        karpenter.sh/discovery: ${var.cluster_name}
        Name: ${var.cluster_name}-karpenter-node
  YAML
}
