################################################################################
# FILE DEFINITION : Security Groups & Stateful Firewall Rules (EKS) Creates security groups and network rules for EKS resources. It controls which traffic is allowed between the cluster, worker nodes, and other resources.
# PURPOSE         : Restricts network ingress and egress between EKS control plane, worker nodes, and databases.
# HOW IT WORKS    : Creates aws_security_group and stateful rules allowing HTTPS (port 443), Kubelet communication, and inter-node pod traffic.
################################################################################

resource "aws_security_group" "cluster_sg" {
  name        = "${local.cluster_name}-cluster-sg"
  description = "Security Group for EKS Control Plane"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, { Name = "${local.cluster_name}-cluster-sg" })
}

resource "aws_security_group" "node_sg" {
  name        = "${local.cluster_name}-node-sg"
  description = "Security Group for EKS Worker Nodes"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow inter-node traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  ingress {
    description     = "Allow control plane to communicate with nodes"
    from_port       = 1025
    to_port         = 65535
    protocol        = "tcp"
    security_groups = [aws_security_group.cluster_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "${local.cluster_name}-node-sg"
    "kubernetes.io/cluster/${local.cluster_name}" = "owned"
  })
}

resource "aws_security_group_rule" "cluster_ingress_node_https" {
  description              = "Allow worker nodes to communicate with EKS control plane API server"
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.cluster_sg.id
  source_security_group_id = aws_security_group.node_sg.id
}
