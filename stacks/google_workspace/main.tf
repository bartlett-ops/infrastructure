module "stack" {
  source       = "../../modules/stacks/google_workspace"
  stack_config = local.stack_config
}
