variable "stack_config" {
  type = object({
    dynamodb_table_name = string
    remote_states = map(object({
      bucket_name = string
    }))
  })
}

