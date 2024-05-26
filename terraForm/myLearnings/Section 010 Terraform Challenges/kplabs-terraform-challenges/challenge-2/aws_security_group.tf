resource "aws_security_group" "payment_app" {
  name        = "payment_app"
  description = "Application Security Group"
  depends_on  = [aws_eip.example]

  # Below ingress allows HTTPS  from DEV VPC
  ingress {
    description = "Below ingress allows HTTPS  from DEV VPC"
    from_port   = var.https
    to_port     = var.https
    protocol    = "tcp"
    cidr_blocks = [var.cidr_Value_for_DEV_VPC]
  }

  # Below ingress allows APIs access from DEV VPC

  ingress {
    description = "Below ingress allows APIs access from DEV VPC"
    from_port   = var.apis_access_from_DEV_VPC
    to_port     = var.apis_access_from_DEV_VPC
    protocol    = "tcp"
    cidr_blocks = [var.cidr_Value_for_DEV_VPC]
  }

  # Below ingress allows APIs access from Prod App Public IP.

  ingress {
    description = "Below ingress allows APIs access from Prod App Public IP"
    from_port   = var.apis_access_from_PROD_App_Public_IP
    to_port     = var.apis_access_from_PROD_App_Public_IP
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.example.public_ip}/32"]
  }

  egress {
    description = "Allow splunk"
    from_port   = var.splunk
    to_port     = var.splunk
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "payment_app"
    Team = "Payments Teams"
    Env  = "Production"
  }
}
