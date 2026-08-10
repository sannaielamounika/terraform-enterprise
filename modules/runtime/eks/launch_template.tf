resource "aws_launch_template" "node" {
  name_prefix            = "${local.cluster_name}-node-template-"
  description            = "Launch template for EKS managed node group"
  update_default_version = true
  vpc_security_group_ids = [aws_security_group.node_sg.id]

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size           = 50
      volume_type           = "gp3"
      encrypted             = true
      delete_on_termination = true
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags          = merge(local.common_tags, { Name = "${local.cluster_name}-node" })
  }
}
