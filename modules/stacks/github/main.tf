resource "github_repository" "repos" {
  for_each = var.stack_config.repositories
  name = each.key
  description = each.value.description
  visibility = each.value.visibility
}

resource "github_branch" "branch" {
  for_each = var.stack_config.repositories
  repository = each.key
  branch = each.value.default_branch
  depends_on = [
    github_repository.repos 
  ]
}

resource "github_branch_default" "branch_default" {
  for_each = var.stack_config.repositories
  repository = each.key
  branch = each.value.default_branch
  depends_on = [
    github_branch.branch
  ]
}
