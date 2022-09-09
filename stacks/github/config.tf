locals {
  stack_name = basename(abspath(path.root))
  stack_config = {
    name = local.stack_name
    repositories = {
      digital_cv = {}
      infrastructure = {
        terraform_executor_configs = {
          github = {
            aws_iam_user_config = {
              policy_document = data.aws_iam_policy_document.github
            }
            github_pat_config = {}
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
