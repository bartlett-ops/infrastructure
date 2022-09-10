variable "github_token" {
  type      = string
  sensitive = true
}

variable "pipeline" {
  type    = bool
  default = false
}
