provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "myimageForEC2_debugg" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "Debugging_myec2" {
  ami           = data.aws_ami.myimageForEC2_debugg.image_id
  instance_type = "t2.micro"
}
