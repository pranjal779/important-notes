resource "aws_instance" "practicalMyec2" {
  ami           = var.ami
  instance_type = "t2.micro"
}



