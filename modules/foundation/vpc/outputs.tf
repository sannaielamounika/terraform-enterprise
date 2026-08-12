################################################################################
# FILE DEFINITION : Module Output Values (VPC)
# PURPOSE         : Exposes essential resource attributes (IDs, ARNs, endpoints, names) to parent environments and sibling modules.
# HOW IT WORKS    : Extracts computed values from provisioned AWS resources and returns them as typed module outputs for cross-module wiring.
################################################################################

output "vpc_id" { value = aws_vpc.this.id }
output "public_subnet_ids" { value = aws_subnet.public[*].id }
output "private_subnet_ids" { value = aws_subnet.private[*].id }
output "nat_gateway_ids" { value = aws_nat_gateway.nat[*].id }
