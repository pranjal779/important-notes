provider "aws" {
  region     = "us-west-2"
  access_key = ""
  secret_key = ""
}

resource "aws_iam_user" "iam" {
  for_each = toset(["user-01", "user-02", "user-03"])
  name     = each.key
}
