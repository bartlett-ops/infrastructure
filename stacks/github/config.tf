locals {
  stack_config = {
    repositories = {
      digital_cv = {}
      infrastructure = {
        terraform_executor_configs = {
          github = {
            aws_iam_user = {}
            github_pat = {}
          }
          remote_state = {
            aws_iam_user = {}
          }
        }
      }
    }
  }
}
