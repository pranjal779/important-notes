resource "aws_eip" "lb" {
  # vpc = true
  domain = "vpc"
}

output "eip_addr" {
  value = aws_eip.lb.public_ip
}
