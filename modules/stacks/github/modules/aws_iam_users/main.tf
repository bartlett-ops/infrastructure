resource "aws_iam_user" "users" {
  for_each = var.aws_iam_user_configs
  name = each.key
}

resource "aws_iam_access_key" "keys" {
  for_each = aws_iam_user.users
  user = each.value.name
}
