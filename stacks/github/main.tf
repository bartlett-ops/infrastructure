module "stack" {
  source       = "../../modules/stacks/github"
  stack_config = local.stack_config
}
