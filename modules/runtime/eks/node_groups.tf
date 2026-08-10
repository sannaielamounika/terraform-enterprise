resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${local.cluster_name}-managed-nodes"
  node_role_arn   = aws_iam_role.node_group_role.arn
  subnet_ids      = length(var.private_subnet_ids) > 0 ? var.private_subnet_ids : var.subnet_ids

  scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }

  instance_types = var.node_instance_types
  capacity_type  = "ON_DEMAND"

  launch_template {
    id      = aws_launch_template.node.id
    version = aws_launch_template.node.latest_version
  }

  depends_on = [
    aws_iam_role_policy_attachment.node_worker,
    aws_iam_role_policy_attachment.node_cni,
    aws_iam_role_policy_attachment.node_registry,
    aws_security_group_rule.cluster_ingress_node_https
  ]

  tags = local.common_tags
}
