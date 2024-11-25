resource "aws_dynamodb_table" "dynamodb_tfstate_lock" {
  name         = var.dynamodb_table_tfstate
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  server_side_encryption {
    enabled = true
  }
}
