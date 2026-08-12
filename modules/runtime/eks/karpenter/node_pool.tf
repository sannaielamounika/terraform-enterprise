################################################################################
# FILE DEFINITION : Karpenter NodePool & EC2NodeClass (KARPENTER) Defines when and what type of worker nodes Karpenter should provision. It contains requirements such as instance type, CPU, architecture, capacity type, limits, and disruption rules.
# PURPOSE         : Declares high-performance Kubernetes node autoscaling requirements and EC2 compute templates for Karpente# HOW IT WORKS    : Applies Kubernetes Custom Resource Definitions (CRDs) via kubectl_manifest matching pending pod scheduling constraints.
################################################################################

resource "kubectl_manifest" "karpenter_node_pool" {
  yaml_body = <<YAML
apiVersion: karpenter.sh/v1beta1
kind: NodePool
metadata:
  name: default
spec:
  template:
    spec:
      requirements:
        - key: karpenter.sh/capacity-type
          operator: In
          values: ["on-demand", "spot"]
        - key: node.kubernetes.io/instance-type
          operator: In
          values: ["c5.large", "m5.large", "t3.large"]
      nodeClassRef:
        name: default
  limits:
    cpu: "1000"
    memory: 1000Gi
YAML
}
