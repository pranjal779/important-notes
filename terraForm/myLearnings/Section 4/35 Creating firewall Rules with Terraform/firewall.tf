
provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "allow_tls" {
  name        = "terraform-firewall"
  description = "Managed from Terraform"
}

# Sample resource for security group
resource "aws_security_group#2" "name_allow_tls#2" {
  name        = "terraform-firewall#2"
  description = "Managed from Terraform #2"
  vpc_id      = aws_vpc.main.id

  tags = {
    name = "allows_tls#2"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv6" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv6         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

# example:
# in AWS the portrange (from_port, to_port) will be 80 - 100
resource "aws_vpc_security_group_ingress_rule#3" "allow_tls_ipv6#3" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv6         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 100
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
