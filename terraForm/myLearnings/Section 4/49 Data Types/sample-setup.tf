resource "aws_instance" "EC2name" {
  ami                    = "ami-12341231"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-06dc77ed59c310f03", "sg-06dc77ed59c31d431"]
}

# terraform plan will work here
# single value also works


variable "my-numbered-list" {
  type = list(number)
}
