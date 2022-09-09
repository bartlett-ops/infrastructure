locals {
  stack_config = {
    name = basename(abspath(path.root))
    repositories = {
      digital_cv = {}
      infrastructure = {
        terraform_executor_configs = {
          github = {
            aws_iam_user_config = {
              policy_document = data.aws_iam_policy_document.test
            }
            github_pat_config = {}
          }
          remote_state = {
            aws_iam_user_config = {
              policy_document = data.aws_iam_policy_document.test
            }
          }
        }
      }
    }
  }
}
