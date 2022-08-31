variable "stack_config" {
  type = object({
    bucket_name = string
    dynamodb_table_name = string
  })
}

