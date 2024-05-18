provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "lb" {
  name  = "loadbalancer.${count.index}"
  count = 5
  path  = "/system/"
}
