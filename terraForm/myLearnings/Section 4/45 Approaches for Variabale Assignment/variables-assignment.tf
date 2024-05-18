resource "aws_instance" "name" {
  ami           = "ami-07caf09b362be10b8"
  instance_type = var.instance_type
}
