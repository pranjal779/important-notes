resource "aws_eip" "lb" {
  instance = aws_instance.web.id
  domain   = "vpc"
}
