resource "aws_dynamodb_table" "lock" {
  name = var.stack_config.dynamodb_table_name
  billing_mode = "PROVISIONED"
  read_capacity = 25
  write_capacity = 25
  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "buckets" {
  for_each = var.stack_config.remote_states
  bucket = each.bucket_name
  acl = "private"
  versioning {
    enabled = true
  }
}

