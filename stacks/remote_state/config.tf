locals {
  stack_config = {
    dynamodb_table_name = "terraform-state-lock"
    remote_states = {
      bartlett = {
        bucket_name = "bartlett-remote-states"
      }
    }
  }
}
