locals {
  stack_config = {
    bucket_name = "bartlett-remote-states"
    dynamodb_table_name = "terraform-state-lock"
  }
}
