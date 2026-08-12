################################################################################
# FILE DEFINITION : NAT Gateway & Elastic IPs (VPC)
# PURPOSE         : Provides secure, outbound-only IPv4 internet access for backend workloads, worker nodes, and databases in private subnets.
# HOW IT WORKS    : Allocates static aws_eip and provisions aws_nat_gateway in public subnets with automatic routing for private subnets.
################################################################################

resource "aws_eip" "nat" {
  count  = var.nat_gateway_count
  domain = "vpc"
  tags   = merge(local.common_tags, { Name = "${local.name_prefix}-nat-eip-${count.index + 1}" })
}

resource "aws_nat_gateway" "nat" {
  count         = var.nat_gateway_count
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id
  tags          = merge(local.common_tags, { Name = "${local.name_prefix}-nat-${count.index + 1}" })
  depends_on    = [aws_internet_gateway.igw]
}
