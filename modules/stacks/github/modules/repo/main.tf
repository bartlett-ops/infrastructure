resource "github_repository" "repo" {
  name = var.config.name
  description = var.config.description
  visibility = var.config.visibility
}

resource "github_branch" "branch" {
  repository = github_repository.repo.name
  branch = var.config.default_branch
}

resource "github_branch_default" "branch_default" {
  repository = github_repository.repo.name
  branch = github_branch.branch.branch
}

resource "github_actions_secret" "secrets" {
  for_each = var.config.secrets
  repository = github_repository.repo.name 
  secret_name = each.key
  plaintext_value = each.value
}
