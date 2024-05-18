provider "aws" {
  region     = "us-west-2"
  access_key = ""
  secret_key = ""
}

variable "iam_names" {
  type = list(any)
  # default = ["user-01", "user-02", "user-03"]
  # default = ["user-01", "user-02", "user-03", "user-00"]
  default = ["user-00", "user-01", "user-02", "user-03"]
}

resource "aws_iam_user" "iam" {
  name = var.iam_names[count.index]
  # count = 3
  count = 4
  path  = "/system/"
}
