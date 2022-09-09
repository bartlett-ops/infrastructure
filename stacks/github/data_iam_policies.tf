data "aws_iam_policy_document" "test" {
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
