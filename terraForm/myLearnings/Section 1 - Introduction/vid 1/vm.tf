provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
  ami                    = "ami............."
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.custom_firewall.id]

  tags = {
    Name = "automated-vm"
  }

}
