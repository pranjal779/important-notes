terraform {
  # required_version = "< 0.11" # this line alone will produce error so check this
  required_providers {
    aws = "~> 2.0"
  }
}

provider "aws" {
  region     = "ap-southeast-1"
  access_key = "YOUR-KEY"
  secret_key = "YOUR-KEY"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0b1e534a4ff9019e0"
  instance_type = "t2.micro"
}
