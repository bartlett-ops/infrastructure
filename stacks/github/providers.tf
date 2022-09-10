provider "aws" {
  region  = "eu-west-1"
  profile = var.pipeline ? null : "bartlett"
}

provider "github" {
  owner = "bartlettt"
}
