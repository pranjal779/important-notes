provider "aws" {
  region = "us-east-1"
}

data "aws_iam_users" "users" {}

data "aws_caller_identity" "current" {}

resource "aws_iam_user" "lb" {
  name = "admin-user-${data.aws_caller_identity_current.account_id}"
  path = "/system/"

  tags = {
    count = "number_of_iam_user"
  }
}


output "user_names" {
  value = data.aws_iam_users.users.names
}

output "totla_users" {
  value = length(data.aws_iam_users.users.names)
}
