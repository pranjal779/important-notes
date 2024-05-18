resource "aws_eip" "example_lb" {
  domain = "vpc"
}

resource "aws_security_group" "exampleName_allow_tls" {
  name = "attribute-firewall"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.exampleName_allow_tls.id
  cidr_ipv4         = "${aws_eip.example_lb.public_ip}/32"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
