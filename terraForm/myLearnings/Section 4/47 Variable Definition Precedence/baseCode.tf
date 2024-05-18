resource "aws_instance" "myec2" {
  ami           = "ami-0e670eb768a5fc3d4"
  instance_type = var.instance_type
}
