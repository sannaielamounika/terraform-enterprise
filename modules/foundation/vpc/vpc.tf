################################################################################
# FILE DEFINITION : Virtual Private Cloud (VPC) Core (VPC)
# PURPOSE         : Establishes the isolated Layer 3 software-defined network boundary for all workloads.
# HOW IT WORKS    : Provisions aws_vpc with DNS hostnames/support enabled and assigns the specified RFC 1918 CIDR block.
################################################################################

resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = merge(local.common_tags, { Name = "${local.name_prefix}-vpc" })
}
