module "repos" {
  source = "./modules/repo"
  for_each = var.stack_config.repositories 
  config = merge(
    each.value.repo_config,
    {
      name = each.key 
    }
  )
}
