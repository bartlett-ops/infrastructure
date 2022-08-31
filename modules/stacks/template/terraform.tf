terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.28.0"
    }
  }
  experiments = [
    module_variable_optional_attrs
  ]
}
