variable "stack_config" {
  type = object({
    repositories = map(object({
      description = optional(string)
      visibility = optional(string, "public")
      default_branch = optional(string, "master")
    }))
  })
}

