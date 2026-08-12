################################################################################
# FILE DEFINITION : Module Output Values (RDS)
# PURPOSE         : Exposes essential resource attributes (IDs, ARNs, endpoints, names) to parent environments and sibling modules.
# HOW IT WORKS    : Extracts computed values from provisioned AWS resources and returns them as typed module outputs for cross-module wiring.
################################################################################

output "db_instance_id" { value = aws_db_instance.this.id }
output "db_endpoint"    { value = aws_db_instance.this.endpoint }
output "db_port"        { value = aws_db_instance.this.port }
output "security_group_id" { value = aws_security_group.rds.id }
