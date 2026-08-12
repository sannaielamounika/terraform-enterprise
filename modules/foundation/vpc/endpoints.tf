################################################################################
# FILE DEFINITION : VPC Gateway & Interface Endpoints (VPC)
# PURPOSE         : Enables private, high-speed routing to AWS services (S3, ECR) without traversing the public internet or NAT Gateway.
# HOW IT WORKS    : Creates aws_vpc_endpoint (Gateway type for S3) and associates it directly with private route table IDs for zero-cost data transfer.
################################################################################

# S3 Gateway Endpoint
resource "aws_vpc_endpoint" "s3" {
  count             = var.enable_vpc_endpoints ? 1 : 0
  vpc_id            = aws_vpc.this.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = aws_route_table.private[*].id
  tags = merge(local.common_tags, { Name = "${local.name_prefix}-s3-gw-endpoint" })
}
