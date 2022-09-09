variable "stack_config" {
  type = object({
    repositories = map(object({
      repo_config = optional(
        object({
          description = optional(string)
          visibility = optional(string, "public")
          default_branch = optional(string, "master")
        }),
        {
          description = null
          visibility = "public"
          default_branch = "master"
        }
      )
      terraform_executor_configs = optional(map(object({
        aws_iam_user = optional(object({}))
        github_pat = optional(object({}))
      })), {})
    }))
  })
}

