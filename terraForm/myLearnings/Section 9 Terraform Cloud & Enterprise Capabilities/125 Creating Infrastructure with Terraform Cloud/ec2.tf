provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "myec2" {
  ami           = "ami-082b5a644766e0e6f" # us-west-2 region
  instance_type = "t2.micro"
}
