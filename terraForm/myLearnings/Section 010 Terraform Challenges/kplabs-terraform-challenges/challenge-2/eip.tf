resource "aws_eip" "example" {
  domain = "vpc"

  tags = {
    Name = "payment_app"
    Team = "Payments Teams"
    Env  = "Production"
  }
}
