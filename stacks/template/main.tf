module "stack" {
  source       = "../../modules/stacks/X"
  stack_config = local.stack_config
}
