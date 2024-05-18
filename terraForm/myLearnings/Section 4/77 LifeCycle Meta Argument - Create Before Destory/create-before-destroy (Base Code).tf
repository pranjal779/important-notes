provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0f34c5ae932e6f0e4" # to test change this to a different OS ami id like with Windows
  instance_type = "t2.micro"

  tags = {
    Name = "HelloEarth"
  }
}
