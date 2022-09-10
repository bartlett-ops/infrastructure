provider "aws" {
  region  = "eu-west-1"
  profile = var.pipeline ? "bartlett" : null
}
provider "github" {
  owner = "bartlettt"
}
