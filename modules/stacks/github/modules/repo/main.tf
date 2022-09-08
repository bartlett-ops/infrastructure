resource "github_repository" "repo" {
  name = var.name
  description = var.description
  visibility = var.visibility
}

resource "github_branch" "branch" {
  repository = github_repository.repo.name
  branch = var.default_branch
}

resource "github_branch_default" "branch_default" {
  repository = github_repository.repo.name
  branch = github_branch.branch.branch
}
