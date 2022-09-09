terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.28.0"
    }
    github = {
      source  = "integrations/github"
      version = "4.31.0"
    }
  }
}
