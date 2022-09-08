variable "stack_config" {
  type = object({
    repositories = map(object({
      description = optional(string)
      visibility = optional(string, "public")
      default_branch = optional(string, "master")
    }))
  })
  validation {
    condition = !contains([ 
      for vis in [ 
        for repo in var.stack_config.repositories : repo.visibility ]
        : contains(["public", "private", "internal"], vis) 
      ], false)
    error_message = "Visibility must be set to one of [\"public\", \"private\", \"internal\"]."
  }
}

