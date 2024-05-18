provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "lb" {
  name  = "loadbalancer"
  count = 5
  path  = "/system/"
}

# each ec2 instance will have the same name and will be confusing
