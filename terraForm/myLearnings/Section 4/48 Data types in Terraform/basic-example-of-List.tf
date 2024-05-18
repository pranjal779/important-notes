variable "username" {
  type = number
}

resource "aws_iam_user" "lb" {
  name = var.username
}

resource "aws_instance" "nameWeb" {
  ami                    = "ami-0e670eb768a5fc3d4"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-06dc77ed59c310f03"]

  tags = {
    Name = "eampleHelloWorld"
  }
}
