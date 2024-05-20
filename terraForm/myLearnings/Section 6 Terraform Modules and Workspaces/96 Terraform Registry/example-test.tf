provider "aws" {
  region     = "us-west-2"
  access_key = "your-access-key"
  secret_key = "your-secret-key"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name = "single-instance"
  #   instance_count = 1 # this line is throwing # "Unexpected attribute: An attribute named "instance_count" is not expected hereTerraform"
  # maybe the above line in no longer required

  # always take the ami id from the ec2 of the region mentioned in providers "aws"...
  ami           = "ami-.........."
  instance_type = "t2.micro"
  #   key_name               = "user1" # Not required
  #   monitoring             = true # Not required
  #   vpc_security_group_ids = ["sg-12345678"] # Not required
  subnet_id = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# code taken from:
# [Single EC2 Instance](https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest#single-ec2-instance)
