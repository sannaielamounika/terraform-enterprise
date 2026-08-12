################################################################################
# FILE DEFINITION : launch_template.tf for EKS Module  Defines the EC2 launch configuration for worker nodes. It specifies things such as AMI, instance type, security groups, disk, user data, #and other EC2 settings.
# PURPOSE         : Manages the launch_template component within the eks architecture.
# HOW IT WORKS    : Executes declarative Terraform configuration to provision, configure, and manage AWS resources for eks.
################################################################################

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
