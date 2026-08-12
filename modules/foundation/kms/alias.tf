################################################################################
# FILE DEFINITION : KMS Key Display Alias (KMS)
# PURPOSE         : Creates human-readable aliases for KMS keys to simplify key referencing without hardcoding raw UUIDs.
# HOW IT WORKS    : Binds aws_kms_alias to the underlying aws_kms_key.key_id with the prefix 'alias/'.
################################################################################

resource "aws_kms_alias" "this" {
  name          = local.alias_name
  target_key_id = aws_kms_key.this.key_id
}
