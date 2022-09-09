module "stack" {
  source       = "../../modules/stacks/github"
  stack_name   = local.stack_name
  stack_config = local.stack_config
}
