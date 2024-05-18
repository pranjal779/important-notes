provider "aws" {
  region = "us-east-1"
}

# This will create the resources first and then destory later

resource "aws_instance" "myec2" {
  ami           = "ami-0f34c5ae932e6f0e4"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloEarth"
  }

  lifecycle {
    create_before_destroy = true
  }
}
