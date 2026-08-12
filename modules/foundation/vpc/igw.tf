################################################################################
# FILE DEFINITION : Internet Gateway (IGW) (VPC)
# PURPOSE         : Enables bidirectional IPv4 communication between public-facing load balancers and the public internet.
# HOW IT WORKS    : Attaches aws_internet_gateway to the VPC and binds default routes (0.0.0.0/0) in public route tables.
################################################################################

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
  tags   = merge(local.common_tags, { Name = "${local.name_prefix}-igw" })
}
