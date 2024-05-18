provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-KEY"
  secret_key = "YOUR-KEY"
}

resource "aws_instance" "myec2" {
  ami           = "ami-082b5a644766e0e6f"
  instance_type = var.list[1] # for list
  # instance_type = "t2.micro"
  # instance_type = var.types["us-west-2"]
  # to try
  # instance_type = var.types["ap-south-1"]
}

variable "list" {
  type    = list(any)
  default = ["m5.large", "m5.xlarge", "t2.medium"]
}

variable "types" {
  type = map(any)
  default = {
    us-east-1  = "t2.micro"
    us-west-2  = "t2.nano"
    ap-south-1 = "t2.small"
  }
}
