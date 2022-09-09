locals {
  executor_configs = {
    for key, value in var.stack_config.repositories : key => value.terraform_executor_configs
  }
}

module "aws_iam_users" {
  source      = "./modules/aws_iam_users"
  for_each    = var.stack_config.repositories
  name_prefix = "${var.stack_config.name}-${each.key}"
  aws_iam_user_configs = {
    for key, value in each.value.terraform_executor_configs :
    key => value.aws_iam_user_config
    if try(value.aws_iam_user_config, null) != null
  }
}

module "repos" {
  source   = "./modules/repo"
  for_each = var.stack_config.repositories
  config = merge(
    each.value.repo_config,
    {
      name = each.key
      secrets = merge(
        merge([for key, value in module.aws_iam_users[each.key].credentials :
          {
            upper("stacks_${key}__aws_access_key_id")     = value.aws_access_key_id
            upper("stacks_${key}__aws_secret_access_key") = value.aws_secret_access_key
          }
        ]...),
        merge([for key, value in local.executor_configs[each.key] :
          {
            upper("stacks_${key}__github_token") = value.github_pat_config.token
          }
          if try(value.github_pat_config.token, null) != null
        ]...)
      )
    }
  )
}
