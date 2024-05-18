provider "aws" {
  # region = "us-east-1" # change it to a different region for testing
  region = "ap-south-1" # to test whether it is dectecting new ami_id or not
}

data "aws_ami" "myimage" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    # ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"] works for ubuntu image (os) architecture "amd64"
    # ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-arm64-server-*"] works for aws image (os) architecture  "amr64"
  }
}

# do this:
resource "aws_instance" "web" {
  ami           = data.aws_ami.myimage.image_id
  instance_type = "t2.micro"
}

# # instead of this:
# resource "aws_instance" "web" {
#   ami           = "ami-1234"
#   instance_type = "t2.micro"
# }
