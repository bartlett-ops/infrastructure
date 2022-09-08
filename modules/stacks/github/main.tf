module "repos" {
  source = "./modules/repo"
  for_each = var.stack_config.repositories 
  name = each.key 
  description = each.value.description 
  visibility = each.value.visibility 
  default_branch = each.value.default_branch 
}
