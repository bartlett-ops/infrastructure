variable "config" {
  type = object({
    name = string
    default_branch = string
    description = string
    visibility = string 
  })
  validation {
    condition = contains(["public", "private", "internal"], var.config.visibility)
    error_message = "Visibility must be set to one of [\"public\", \"private\", \"internal\"]."
  }
}
