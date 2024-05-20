resource "aws_instance" "myec2" {
  ami = "ami-082b5a644766e0e6f"
  # instance_type = "t2.micro"
  instance_type = var.instance_type # do this instead if your instance_type is changing frequently
}

