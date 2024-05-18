provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "instance" {
  ami           = "ami-123141"
  instance_type = "t2.micro"
  count         = 3
}
