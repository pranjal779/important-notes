# when multiple resources are present
terraform apply -auto-approve
# should provide a error
# Error: multiple EC2 Instances matched; use additional constraints to reduce matches to a single EC2 Instance
# because multiple ec2 is present in aws account


# after changing data "aws_instance" "example" {} to data "aws_instances" "example" {}
terraformapply -auto-approve
# it will prefectly