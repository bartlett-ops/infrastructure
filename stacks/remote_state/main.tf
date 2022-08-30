module "stack" {
  source = "../../modules/stacks/remote_state"
  stack_config = local.stack_config
}
