provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "Demo-Varaible-chk" {
  name        = "terraform-firewall"
  description = "Managed from Terraform"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls-ipv4" {
  security_group_id = aws_security_group.Demo-Varaible-chk.id
  cidr_ipv4         = var.vpn_ip
  from_port         = var.app_port
  ip_protocol       = "tcp"
  to_port           = var.app_port
}
