output "s3_bucket_id" { value = aws_s3_bucket.state_bucket.id }
output "dynamodb_table_name" { value = aws_dynamodb_table.state_locks.name }
output "kms_key_arn" { value = aws_kms_key.state_key.arn }
