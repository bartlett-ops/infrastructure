terraform {
  backend "s3" {
    bucket         = "bartlett-remote-states"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "infrastructure/google_workspace/terraform.tfstate"
    profile        = "bartlett"
    region         = "eu-west-1"
  }
  # Provider versions set in modules/stacks/x
  required_providers {
    aws = {}
  }
}
