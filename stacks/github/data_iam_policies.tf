data "aws_iam_policy_document" "github" {
  statement {
    sid     = "iam"
    actions = ["iam:*"]
    resources = [
      "arn:aws:iam::*:user/${local.stack_name}-*",
      "arn:aws:iam::*:policy/${local.stack_name}-*",
    ]
  }
  statement {
    sid = "S3BackendBucket"
    actions = [
      "s3:ListBucket",
    ]
    resources = [
      "arn:aws:s3:::bartlett-remote-states"
    ]
  }
  statement {
    sid = "S3BackendBucketObjects"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
    ]
    resources = [
      "arn:aws:s3:::bartlett-remote-states/infrastructure/github/terraform.tfstate"
    ]
  }
  statement {
    sid = "S3BackendDynamoDB"
    actions = [
      "dynamodb:PutItem",
      "dynamodb:GetItem",
      "dynamodb:DeleteItem",
    ]
    resources = [
      "arn:aws:dynamodb:eu-west-1:150539654980:table/terraform-state-lock"
    ]
  }
}

data "aws_iam_policy_document" "remote_state" {
  statement {
    sid = "S3"
    actions = [
      "s3:*",
    ]
    resources = [
      "arn:aws:s3:::bartlett-remote-states"
    ]
  }
  statement {
    sid = "DynamoDB"
    actions = [
      "dynamodb:*",
    ]
    resources = [
      "arn:aws:dynamodb:eu-west-1:150539654980:table/terraform-state-lock"
    ]
  }
  statement {
    sid = "S3BackendBucketObjects"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
    ]
    resources = [
      "arn:aws:s3:::bartlett-remote-states/infrastructure/remote_state/terraform.tfstate"
    ]
  }
  statement {
    sid = "S3BackendDynamoDB"
    actions = [
      "dynamodb:PutItem",
      "dynamodb:GetItem",
      "dynamodb:DeleteItem",
    ]
    resources = [
      "arn:aws:dynamodb:eu-west-1:150539654980:table/terraform-state-lock"
    ]
  }
}

data "aws_iam_policy_document" "google_workspace" {
  statement {
    sid = "Route53List"
    actions = [
      "route53:ListHostedZones",
    ]
    resources = [
      "*"
    ]
  }
  statement {
    sid = "Route53Admin"
    actions = [
      "route53:*",
    ]
    resources = [
      "arn:aws:route53:::hostedzone/Z08555331FK81U1K56PZJ",
      "arn:aws:route53:::hostedzone/Z08555331FK81U1K56PZJ/*"
    ]
  }
  statement {
    sid = "S3BackendBucketObjects"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
    ]
    resources = [
      "arn:aws:s3:::bartlett-remote-states/infrastructure/google_workspace/terraform.tfstate"
    ]
  }
  statement {
    sid = "S3BackendDynamoDB"
    actions = [
      "dynamodb:PutItem",
      "dynamodb:GetItem",
      "dynamodb:DeleteItem",
    ]
    resources = [
      "arn:aws:dynamodb:eu-west-1:150539654980:table/terraform-state-lock"
    ]
  }
}
