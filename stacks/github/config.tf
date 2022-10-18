locals {
  stack_name = basename(abspath(path.root))
  stack_config = {
    repositories = {
      digital_cv = {}
      infrastructure = {
        terraform_executor_configs = {
          github = {
            aws_iam_user_config = {
              policy_document = data.aws_iam_policy_document.github
            }
            github_pat_config = {
              token = var.github_token
            }
          }
          google_workspace = {
            aws_iam_user_config = {
              policy_document = data.aws_iam_policy_document.google_workspace
            }
          }
          remote_state = {
            aws_iam_user_config = {
              policy_document = data.aws_iam_policy_document.remote_state
            }
          }
        }
      }
    }
  }
}
