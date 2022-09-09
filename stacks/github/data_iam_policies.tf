data "aws_iam_policy_document" "github" {
  statement {
    sid = "iam"
    actions = [ "iam:*" ]
    resources = [ 
      "arn:aws:iam::*:user/${local.stack_name}-*",
      "arn:aws:iam::*:policy/${local.stack_name}-*",
    ]
  }
}


data "aws_iam_policy_document" "remote_state" {
  statement {
    sid = "test"
    actions = [
      "s3:ListAllMyBuckets"
    ]
    resources = [
      "*"
    ]
  }
}
