resource "aws_eip" "myeip_01" {
  domain = "vpc"
}

resource "aws_eip" "myeip_02" {
  domain   = "vpc"
  provider = "aws.us-west"
}
