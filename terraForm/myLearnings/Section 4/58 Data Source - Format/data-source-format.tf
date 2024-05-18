provider "aws" {
  region = "us-east-1"
}

# when multiple resources are present but will return very little info:
data "aws_instances" "example" {}

# will target only 1 resource but will return huge ammount of info:
data "aws_instance" "example" {
  filter {
    name   = "tag:Team"
    values = ["Production"]
  }
}
