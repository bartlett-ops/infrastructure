module "aws_iam_users" {
  source = "./modules/aws_iam_users"
  for_each = var.stack_config.repositories
  aws_iam_user_configs = { 
    for key, value in each.value.terraform_executor_configs : 
      key => value.aws_iam_user 
      if try(value.aws_iam_user, null) != null 
  }
}

#resource "local_file" "debug" {
#  for_each = var.stack_config.repositories 
#  filename = each.key
#  content = jsonencode({
#    secrets = merge([ for key, value in module.aws_iam_users[each.key].credentials :
#      {
#        "${key}_aws_access_key_id" = value.aws_access_key_id
#        "${key}_aws_secret_access_key" = nonsensitive(value.aws_secret_access_key)
#      }
#    ]...)
#  })
#}

module "repos" {
  source = "./modules/repo"
  for_each = var.stack_config.repositories 
  config = merge(
    each.value.repo_config,
    {
      name = each.key 
      secrets = merge([ for key, value in module.aws_iam_users[each.key].credentials :
        {
          upper("stacks_${key}__aws_access_key_id") = value.aws_access_key_id
          upper("stacks_${key}__aws_secret_access_key") = value.aws_secret_access_key
        }
      ]...)
      #secrets = { for k,v in flatten([ for key, value in module.aws_iam_users[each.key].credentials :
      #  {
      #    "${key}_aws_access_key_id" = value.aws_access_key_id
      #    "${key}_aws_secret_access_key" = value.aws_secret_access_key 
      #  }
      #]) : k => v }
    }
  )
}
