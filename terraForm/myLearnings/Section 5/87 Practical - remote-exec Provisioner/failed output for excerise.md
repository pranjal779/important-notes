PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 5\87 Practical - remote-exec Provisioner> terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are
indicated with the following symbols:

- create

Terraform will perform the following actions:

# aws_instance.remote-exec-ec2 will be created

- resource "aws_instance" "remote-exec-ec2" {
  - ami = "ami-0bb84b8ffd87024d8"
  - arn = (known after apply)
  - associate_public_ip_address = (known after apply)
  - availability_zone = (known after apply)
  - cpu_core_count = (known after apply)
  - cpu_threads_per_core = (known after apply)
  - disable_api_stop = (known after apply)
  - disable_api_termination = (known after apply)
  - ebs_optimized = (known after apply)
  - get_password_data = false
  - host_id = (known after apply)
  - host_resource_group_arn = (known after apply)
  - iam_instance_profile = (known after apply)
  - id = (known after apply)
  - instance_initiated_shutdown_behavior = (known after apply)
  - instance_lifecycle = (known after apply)
  - instance_state = (known after apply)
  - instance_type = "t2.micro"
  - ipv6_address_count = (known after apply)
  - ipv6_addresses = (known after apply)
  - key_name = "Private-spArchiePEM-Key"
  - monitoring = (known after apply)
  - outpost_arn = (known after apply)
  - password_data = (known after apply)
  - placement_group = (known after apply)
  - placement_partition_number = (known after apply)
  - primary_network_interface_id = (known after apply)
  - private_dns = (known after apply)
  - private_ip = (known after apply)
  - public_dns = (known after apply)
  - public_ip = (known after apply)
  - secondary_private_ips = (known after apply)
  - security_groups = (known after apply)
  - source_dest_check = true
  - spot_instance_request_id = (known after apply)
  - subnet_id = (known after apply)
  - tags_all = (known after apply)
  - tenancy = (known after apply)
  - user_data = (known after apply)
  - user_data_base64 = (known after apply)
  - user_data_replace_on_change = false
  - vpc_security_group_ids = [
    + "sg-08faea0f199735865",
    ]
    }

Plan: 1 to add, 0 to change, 0 to destroy.
aws_instance.remote-exec-ec2: Creating...
╷
│ Error: creating EC2 Instance: InvalidKeyPair.NotFound: The key pair 'Private-spArchiePEM-Key' does not exist
│ status code: 400, request id: 5a3cf504-0c0e-4dba-a772-3ac8944a2690
│
│ with aws_instance.remote-exec-ec2,
│ on My-Example-Usage.tf line 1, in resource "aws_instance" "remote-exec-ec2":
│ 1: resource "aws_instance" "remote-exec-ec2" {
│
╵
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 5\87 Practical - remote-exec Provisioner> terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are  
indicated with the following symbols:

- create

Terraform will perform the following actions:

# aws_instance.remote-exec-ec2 will be created

- resource "aws_instance" "remote-exec-ec2" {
  - ami = "ami-0bb84b8ffd87024d8"
  - arn = (known after apply)
  - associate_public_ip_address = (known after apply)
  - availability_zone = (known after apply)
  - cpu_core_count = (known after apply)
  - cpu_threads_per_core = (known after apply)
  - disable_api_stop = (known after apply)
  - disable_api_termination = (known after apply)
  - ebs_optimized = (known after apply)
  - get_password_data = false
  - host_id = (known after apply)
  - host_resource_group_arn = (known after apply)
  - iam_instance_profile = (known after apply)
  - id = (known after apply)
  - instance_initiated_shutdown_behavior = (known after apply)
  - instance_lifecycle = (known after apply)
  - instance_state = (known after apply)
  - instance_type = "t2.micro"
  - ipv6_address_count = (known after apply)
  - ipv6_addresses = (known after apply)
  - key_name = <<-EOT
    -----BEGIN RSA PRIVATE KEY-----
    MIIEpAIBAAKCAQEAi8eAcceu1XjWhEAibrGlXJ8w7A5rX6ZGBw2thVQhfTlypWOK
    +UmXmAUyAWoH0PwgsFUNnCWxlQugFZ+9HkjD7HanoKQR2NrZBen5D3aYbMBi4Muh
    YNWbPbdkTucDNhYxyNAU2nscEQEE3wxj2ACb3Pc7cLtWLF1mXlkxkT4sSjMCuxGw
    8l8n/ZwIG/GyOpRWqVajQYYxs3CxujgYjCrPvp631A/dGulsq8MIQ7KIOtaDEMUF
    5sAHrKMWioPUKlDBTXzAfjY29ih2/uJP+BmQS7gM+6WsTzhv/UE2XnwpI5D3FAA8
    EnGVsbdo+jycgUd20G94Q3wWmiDuQlBd2W3qkQIDAQABAoIBAA1Dmjmx1DJnrBuS
    pnHQo7t9U7wixiemdKC4uI2dZSwn5mwxXP+47wy6+XrO3/0B3+w7tfXqUcat+rvy
    k5SrHQR0YgXJa/QjGFMKV9sSyvYO75MbX637tyaNH5SpMVHRm1nN/RyacBhg+2Bb
    IaJetGusflR9QnklR9COMDjzKGrF9d8Okr1wcR2Jgd+G2Do3WNnvlrLxGRIqNzbO
    hPrso7nQUw6hkYmaCWFIFeeRIGrReQW6ZrcWH2DbRlAI+odhnEbV7s7kFEBB76UC
    pYySOW3nQnv0PVENz64z8kXB3Khh6UZgOhi1JigUyFe8+u7bVUQn4dmj68fYOdz0
    yk/fTFECgYEA5OXxPQy+woYiFq2TDMM7+L0QtqTDP+2PdkTfDYWK9uC66VESNujL
    3eSuHGejjZBRS/uA6Qydi2Gn+0AvJ98w0ZtYUbCSW563aLHFGG99Aig0tHVGHWqU
    XGYH2uvsDiH7CLfiRlz7cZgkFTAKh/US80Ylch76JwZEheSW/VA8hw0CgYEAnFRO
    RtzkavvLJKNRhm0Hzkob/jVyofHfXUDVU5R95q3j73xrgmrGX2z+zvoGVdjVqBIJ
    rrfE8P6DGydz5Lb4Gnz9oTILS+lm7vo9GJxBlRcYI2oQTlXrYkE/WP1ndZk2CF0g
    Hz8FpRlUvYTnLMzSah8sglA7u819k9P2P3QskJUCgYEA0jkVLDquYD2MxUM5ELmm
    NLZ/yR7da7Mk1Tw/l02U6VRQlcQtdFyuD+bcuZ29qmBnKd+c72z0rHROMQUryfTE
    A14m6S+/24GTdQX/vId4Sije7vXeJVojVBEpGbkfnYM76S/pEzKGhDd0vDjZEzDT
    7LX54ivtFzY8bLQasB+m12kCgYBETM0aRr4BQ9tAOZ6PxakIZvaN/RoFSSCWpJHP
    f2v2UfjpFAoAo9fhr0Qwd6o27ZKDaMYUMLP5uqjbP0RyI8KICB3jxHKNCv9u36O7
    0eERW1KvflJ7dyxs9CbSIXyHM5YY118GZ8l2lXehiaRavW4c8VvH33gJmEEKSiwn
    EwG5dQKBgQC+Iyy6hi0MjD08MEfslXfvHHVbHCVkZRxQcCAcC1JjLBCPIxJQqRnv
    XZ1MauwpheCzVJ/CwvkVuhzzcjxdLHFZYcVNglgvLQYgXWRUKcLe3bl+WqAok3LC
    f7SUc3p1AoEEG/te1rBJene4Ner8RXGl1MUA7JfSqLix4UmoRrjz0g==
    -----END RSA PRIVATE KEY-----
    EOT
  - monitoring = (known after apply)
  - outpost_arn = (known after apply)
  - password_data = (known after apply)
  - placement_group = (known after apply)
  - placement_partition_number = (known after apply)
  - primary_network_interface_id = (known after apply)
  - private_dns = (known after apply)
  - private_ip = (known after apply)
  - public_dns = (known after apply)
  - public_ip = (known after apply)
  - secondary_private_ips = (known after apply)
  - security_groups = (known after apply)
  - source_dest_check = true
  - spot_instance_request_id = (known after apply)
  - subnet_id = (known after apply)
  - tags_all = (known after apply)
  - tenancy = (known after apply)
  - user_data = (known after apply)
  - user_data_base64 = (known after apply)
  - user_data_replace_on_change = false
  - vpc_security_group_ids = [
    + "sg-08faea0f199735865",
    ]
    }

Plan: 1 to add, 0 to change, 0 to destroy.
aws_instance.remote-exec-ec2: Creating...
╷
│ Error: creating EC2 Instance: InvalidParameterValue: Value for parameter -----BEGIN RSA PRIVATE KEY-----
│ MIIEpAIBAAKCAQEAi8eAcceu1XjWhEAibrGlXJ8w7A5rX6ZGBw2thVQhfTlypWOK+UmXmAUyAWoH0PwgsFUNnCWxlQugFZ+9HkjD7HanoKQR2NrZBen5D3aYbMBi4Muh
│ YNWbPbdkTucDNhYxyNAU2nscEQEE3wxj2ACb3Pc7cLtWLF1mXlkxkT4sSjMCuxGw8l8n/ZwIG/GyOpRWqVajQYYxs3CxujgYjCrPvp631A/dGulsq8MIQ7KIOtaDEMUF
│ 5sAHrKMWioPUKlDBTXzAfjY29ih2/uJP+BmQS7gM+6WsTzhv/UE2XnwpI5D3FAA8EnGVsbdo+jycgUd20G94Q3wWmiDuQlBd2W3qkQIDAQABAoIBAA1Dmjmx1DJnrBuS
│ pnHQo7t9U7wixiemdKC4uI2dZSwn5mwxXP+47wy6+XrO3/0B3+w7tfXqUcat+rvyk5SrHQR0YgXJa/QjGFMKV9sSyvYO75MbX637tyaNH5SpMVHRm1nN/RyacBhg+2Bb
│ IaJetGusflR9QnklR9COMDjzKGrF9d8Okr1wcR2Jgd+G2Do3WNnvlrLxGRIqNzbOhPrso7nQUw6hkYmaCWFIFeeRIGrReQW6ZrcWH2DbRlAI+odhnEbV7s7kFEBB76UC
│ pYySOW3nQnv0PVENz64z8kXB3Khh6UZgOhi1JigUyFe8+u7bVUQn4dmj68fYOdz0yk/fTFECgYEA5OXxPQy+woYiFq2TDMM7+L0QtqTDP+2PdkTfDYWK9uC66VESNujL
│ 3eSuHGejjZBRS/uA6Qydi2Gn+0AvJ98w0ZtYUbCSW563aLHFGG99Aig0tHVGHWqUXGYH2uvsDiH7CLfiRlz7cZgkFTAKh/US80Ylch76JwZEheSW/VA8hw0CgYEAnFRO
│ RtzkavvLJKNRhm0Hzkob/jVyofHfXUDVU5R95q3j73xrgmrGX2z+zvoGVdjVqBIJrrfE8P6DGydz5Lb4Gnz9oTILS+lm7vo9GJxBlRcYI2oQTlXrYkE/WP1ndZk2CF0g
│ Hz8FpRlUvYTnLMzSah8sglA7u819k9P2P3QskJUCgYEA0jkVLDquYD2MxUM5ELmmNLZ/yR7da7Mk1Tw/l02U6VRQlcQtdFyuD+bcuZ29qmBnKd+c72z0rHROMQUryfTE
│ A14m6S+/24GTdQX/vId4Sije7vXeJVojVBEpGbkfnYM76S/pEzKGhDd0vDjZEzDT7LX54ivtFzY8bLQasB+m12kCgYBETM0aRr4BQ9tAOZ6PxakIZvaN/RoFSSCWpJHP
│ f2v2UfjpFAoAo9fhr0Qwd6o27ZKDaMYUMLP5uqjbP0RyI8KICB3jxHKNCv9u36O70eERW1KvflJ7dyxs9CbSIXyHM5YY118GZ8l2lXehiaRavW4c8VvH33gJmEEKSiwn
│ EwG5dQKBgQC+Iyy6hi0MjD08MEfslXfvHHVbHCVkZRxQcCAcC1JjLBCPIxJQqRnvXZ1MauwpheCzVJ/CwvkVuhzzcjxdLHFZYcVNglgvLQYgXWRUKcLe3bl+WqAok3LC
│ f7SUc3p1AoEEG/te1rBJene4Ner8RXGl1MUA7JfSqLix4UmoRrjz0g==-----END RSA PRIVATE KEY----- is invalid. Length exceeds maximum of 255.
│ status code: 400, request id: eb2df4fe-09a2-4134-8012-c78982083092
│
│ with aws_instance.remote-exec-ec2,
│ on My-Example-Usage.tf line 1, in resource "aws_instance" "remote-exec-ec2":
│ 1: resource "aws_instance" "remote-exec-ec2" {
│
╵
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 5\87 Practical - remote-exec Provisioner> terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are  
indicated with the following symbols:

- create

Terraform will perform the following actions:

# aws_instance.remote-exec-ec2 will be created

- resource "aws_instance" "remote-exec-ec2" {
  - ami = "ami-0bb84b8ffd87024d8"
  - arn = (known after apply)
  - associate_public_ip_address = (known after apply)
  - availability_zone = (known after apply)
  - cpu_core_count = (known after apply)
  - cpu_threads_per_core = (known after apply)
  - disable_api_stop = (known after apply)
  - disable_api_termination = (known after apply)
  - ebs_optimized = (known after apply)
  - get_password_data = false
  - host_id = (known after apply)
  - host_resource_group_arn = (known after apply)
  - iam_instance_profile = (known after apply)
  - id = (known after apply)
  - instance_initiated_shutdown_behavior = (known after apply)
  - instance_lifecycle = (known after apply)
  - instance_state = (known after apply)
  - instance_type = "t2.micro"
  - ipv6_address_count = (known after apply)
  - ipv6_addresses = (known after apply)
  - key_name = "Private-spArchiePEM-Key"
  - monitoring = (known after apply)
  - outpost_arn = (known after apply)
  - password_data = (known after apply)
  - placement_group = (known after apply)
  - placement_partition_number = (known after apply)
  - primary_network_interface_id = (known after apply)
  - private_dns = (known after apply)
  - private_ip = (known after apply)
  - public_dns = (known after apply)
  - public_ip = (known after apply)
  - secondary_private_ips = (known after apply)
  - security_groups = (known after apply)
  - source_dest_check = true
  - spot_instance_request_id = (known after apply)
  - subnet_id = (known after apply)
  - tags_all = (known after apply)
  - tenancy = (known after apply)
  - user_data = (known after apply)
  - user_data_base64 = (known after apply)
  - user_data_replace_on_change = false
  - vpc_security_group_ids = [
    + "sg-08faea0f199735865",
    ]
    }

Plan: 1 to add, 0 to change, 0 to destroy.
aws_instance.remote-exec-ec2: Creating...
╷
│ Error: creating EC2 Instance: InvalidKeyPair.NotFound: The key pair 'Private-spArchiePEM-Key' does not exist
│ status code: 400, request id: beec03ec-a414-42a0-8c91-60e4c3cb0cdc
│
│ with aws_instance.remote-exec-ec2,
│ on My-Example-Usage.tf line 1, in resource "aws_instance" "remote-exec-ec2":
│ 1: resource "aws_instance" "remote-exec-ec2" {
│
╵
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 5\87 Practical - remote-exec Provisioner> terraform destroy
╷
│ Error: Invalid function argument
│
│ on My-Example-Usage.tf line 12, in resource "aws_instance" "remote-exec-ec2":
│ 12: private_key = file("./PEM-Private-spArchie-key")
│ ├────────────────
│ │ while calling file(path)
│
│ Invalid value for "path" parameter: no file exists at "./PEM-Private-spArchie-key"; this function works  
│ only with files that are distributed as part of the configuration source code, so if this file will be  
│ created by a resource in this configuration you must instead obtain this result from an attribute of  
│ that resource.
╵
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 5\87 Practical - remote-exec Provisioner> terraform destroy

No changes. No objects need to be destroyed.

Either you have not created any objects yet or the existing objects were already deleted outside of  
Terraform.

Destroy complete! Resources: 0 destroyed.
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 5\87 Practical - remote-exec Provisioner> terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are  
indicated with the following symbols:

- create

Terraform will perform the following actions:

# aws_instance.remote-exec-ec2 will be created

- resource "aws_instance" "remote-exec-ec2" {
  - ami = "ami-0bb84b8ffd87024d8"
  - arn = (known after apply)
  - associate_public_ip_address = (known after apply)
  - availability_zone = (known after apply)
  - cpu_core_count = (known after apply)
  - cpu_threads_per_core = (known after apply)
  - disable_api_stop = (known after apply)
  - disable_api_termination = (known after apply)
  - ebs_optimized = (known after apply)
  - get_password_data = false
  - host_id = (known after apply)
  - host_resource_group_arn = (known after apply)
  - iam_instance_profile = (known after apply)
  - id = (known after apply)
  - instance_initiated_shutdown_behavior = (known after apply)
  - instance_lifecycle = (known after apply)
  - instance_state = (known after apply)
  - instance_type = "t2.micro"
  - ipv6_address_count = (known after apply)
  - ipv6_addresses = (known after apply)
  - key_name = "PEM-Private-spArchie-key"
  - monitoring = (known after apply)
  - outpost_arn = (known after apply)
  - password_data = (known after apply)
  - placement_group = (known after apply)
  - placement_partition_number = (known after apply)
  - primary_network_interface_id = (known after apply)
  - private_dns = (known after apply)
  - private_ip = (known after apply)
  - public_dns = (known after apply)
  - public_ip = (known after apply)
  - secondary_private_ips = (known after apply)
  - security_groups = (known after apply)
  - source_dest_check = true
  - spot_instance_request_id = (known after apply)
  - subnet_id = (known after apply)
  - tags_all = (known after apply)
  - tenancy = (known after apply)
  - user_data = (known after apply)
  - user_data_base64 = (known after apply)
  - user_data_replace_on_change = false
  - vpc_security_group_ids = [
    + "sg-08faea0f199735865",
    ]
    }

Plan: 1 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these
actions if you run "terraform apply" now.
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 5\87 Practical - remote-exec Provisioner> terraform validate
Success! The configuration is valid.

PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 5\87 Practical - remote-exec Provisioner> terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are  
indicated with the following symbols:

- create

Terraform will perform the following actions:

# aws_instance.remote-exec-ec2 will be created

- resource "aws_instance" "remote-exec-ec2" {
  - ami = "ami-0bb84b8ffd87024d8"
  - arn = (known after apply)
  - associate_public_ip_address = (known after apply)
  - availability_zone = (known after apply)
  - cpu_core_count = (known after apply)
  - cpu_threads_per_core = (known after apply)
  - disable_api_stop = (known after apply)
  - disable_api_termination = (known after apply)
  - ebs_optimized = (known after apply)
  - get_password_data = false
  - host_id = (known after apply)
  - host_resource_group_arn = (known after apply)
  - iam_instance_profile = (known after apply)
  - id = (known after apply)
  - instance_initiated_shutdown_behavior = (known after apply)
  - instance_lifecycle = (known after apply)
  - instance_state = (known after apply)
  - instance_type = "t2.micro"
  - ipv6_address_count = (known after apply)
  - ipv6_addresses = (known after apply)
  - key_name = "PEM-Private-spArchie-key"
  - monitoring = (known after apply)
  - outpost_arn = (known after apply)
  - password_data = (known after apply)
  - placement_group = (known after apply)
  - placement_partition_number = (known after apply)
  - primary_network_interface_id = (known after apply)
  - private_dns = (known after apply)
  - private_ip = (known after apply)
  - public_dns = (known after apply)
  - public_ip = (known after apply)
  - secondary_private_ips = (known after apply)
  - security_groups = (known after apply)
  - source_dest_check = true
  - spot_instance_request_id = (known after apply)
  - subnet_id = (known after apply)
  - tags_all = (known after apply)
  - tenancy = (known after apply)
  - user_data = (known after apply)
  - user_data_base64 = (known after apply)
  - user_data_replace_on_change = false
  - vpc_security_group_ids = [
    + "sg-08faea0f199735865",
    ]
    }

Plan: 1 to add, 0 to change, 0 to destroy.
aws_instance.remote-exec-ec2: Creating...
aws_instance.remote-exec-ec2: Still creating... [10s elapsed]
aws_instance.remote-exec-ec2: Still creating... [20s elapsed]
aws_instance.remote-exec-ec2: Still creating... [30s elapsed]
aws_instance.remote-exec-ec2: Provisioning with 'remote-exec'...
aws_instance.remote-exec-ec2 (remote-exec): Connecting to remote host via SSH...
aws_instance.remote-exec-ec2 (remote-exec): Host: 54.159.87.51
aws_instance.remote-exec-ec2 (remote-exec): User: ec2-user
aws_instance.remote-exec-ec2 (remote-exec): Password: false
aws_instance.remote-exec-ec2 (remote-exec): Private key: true
aws_instance.remote-exec-ec2 (remote-exec): Certificate: false
aws_instance.remote-exec-ec2 (remote-exec): SSH Agent: false
aws_instance.remote-exec-ec2 (remote-exec): Checking Host Key: false
aws_instance.remote-exec-ec2 (remote-exec): Target Platform: unix
aws_instance.remote-exec-ec2 (remote-exec): Connecting to remote host via SSH...
aws_instance.remote-exec-ec2 (remote-exec): Host: 54.159.87.51
aws_instance.remote-exec-ec2 (remote-exec): User: ec2-user
aws_instance.remote-exec-ec2 (remote-exec): Password: false
aws_instance.remote-exec-ec2 (remote-exec): Private key: true
aws_instance.remote-exec-ec2 (remote-exec): Certificate: false
aws_instance.remote-exec-ec2 (remote-exec): SSH Agent: false
aws_instance.remote-exec-ec2 (remote-exec): Checking Host Key: false
aws_instance.remote-exec-ec2 (remote-exec): Target Platform: unix
aws_instance.remote-exec-ec2 (remote-exec): Connected!
aws_instance.remote-exec-ec2 (remote-exec): Error: This command has to be run with superuser privileges (under the root user on most systems).
aws_instance.remote-exec-ec2 (remote-exec): Failed to start ngnix.service: Access denied
aws_instance.remote-exec-ec2 (remote-exec): See system logs and 'systemctl status ngnix.service' for details.
╷
│ Error: remote-exec provisioner error
│
│ with aws_instance.remote-exec-ec2,
│ on My-Example-Usage.tf line 16, in resource "aws_instance" "remote-exec-ec2":
│ 16: provisioner "remote-exec" {
│
│ error executing "/tmp/terraform_699987311.sh": Process exited with status 4
╵
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 5\87 Practical - remote-exec Provisioner> terraform apply -auto-approve
aws_instance.remote-exec-ec2: Refreshing state... [id=i-0a6ce65119a76db03]

Terraform used the selected providers to generate the following execution plan. Resource actions are  
indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

# aws_instance.remote-exec-ec2 is tainted, so must be replaced

-/+ resource "aws_instance" "remote-exec-ec2" {
~ arn = "arn:aws:ec2:us-east-1:767398044091:instance/i-0a6ce65119a76db03" -> (known after apply)
~ associate_public_ip_address = true -> (known after apply)
~ availability_zone = "us-east-1a" -> (known after apply)
~ cpu_core_count = 1 -> (known after apply)
~ cpu_threads_per_core = 1 -> (known after apply)
~ disable_api_stop = false -> (known after apply)
~ disable_api_termination = false -> (known after apply)
~ ebs_optimized = false -> (known after apply) - hibernation = false -> null + host_id = (known after apply) + host_resource_group_arn = (known after apply) + iam_instance_profile = (known after apply)
~ id = "i-0a6ce65119a76db03" -> (known after apply)
~ instance_initiated_shutdown_behavior = "stop" -> (known after apply) + instance_lifecycle = (known after apply)
~ instance_state = "running" -> (known after apply)
~ ipv6_address_count = 0 -> (known after apply)
~ ipv6_addresses = [] -> (known after apply)
~ monitoring = false -> (known after apply) + outpost_arn = (known after apply) + password_data = (known after apply) + placement_group = (known after apply)
~ placement_partition_number = 0 -> (known after apply)
~ primary_network_interface_id = "eni-0f3198fd820a9d287" -> (known after apply)
~ private_dns = "ip-172-31-18-162.ec2.internal" -> (known after apply)  
 ~ private_ip = "172.31.18.162" -> (known after apply)
~ public_dns = "ec2-54-159-87-51.compute-1.amazonaws.com" -> (known after apply)
~ public_ip = "54.159.87.51" -> (known after apply)
~ secondary_private_ips = [] -> (known after apply)
~ security_groups = [
- "practicing-tfProvisioner-sg",
] -> (known after apply) + spot_instance_request_id = (known after apply)
~ subnet_id = "subnet-010eae5a9f42a9ce7" -> (known after apply) - tags = {} -> null
~ tags_all = {} -> (known after apply)
~ tenancy = "default" -> (known after apply) + user_data = (known after apply) + user_data_base64 = (known after apply) # (7 unchanged attributes hidden)

      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      - cpu_options {
          - core_count       = 1 -> null
          - threads_per_core = 1 -> null
        }

      - credit_specification {
          - cpu_credits = "standard" -> null
        }

      - enclave_options {
          - enabled = false -> null
        }

      - maintenance_options {
          - auto_recovery = "default" -> null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_protocol_ipv6          = "disabled" -> null
          - http_put_response_hop_limit = 2 -> null
          - http_tokens                 = "required" -> null
          - instance_metadata_tags      = "disabled" -> null
        }

      - private_dns_name_options {
          - enable_resource_name_dns_a_record    = false -> null
          - enable_resource_name_dns_aaaa_record = false -> null
          - hostname_type                        = "ip-name" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/xvda" -> null
          - encrypted             = false -> null
          - iops                  = 3000 -> null
          - tags                  = {} -> null
          - tags_all              = {} -> null
          - throughput            = 125 -> null
          - volume_id             = "vol-0a7e0f0b63031ae24" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp3" -> null
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.
aws_instance.remote-exec-ec2: Destroying... [id=i-0a6ce65119a76db03]
aws_instance.remote-exec-ec2: Still destroying... [id=i-0a6ce65119a76db03, 10s elapsed]
aws_instance.remote-exec-ec2: Still destroying... [id=i-0a6ce65119a76db03, 20s elapsed]
aws_instance.remote-exec-ec2: Still destroying... [id=i-0a6ce65119a76db03, 30s elapsed]
aws_instance.remote-exec-ec2: Still destroying... [id=i-0a6ce65119a76db03, 40s elapsed]
aws_instance.remote-exec-ec2: Destruction complete after 40s
aws_instance.remote-exec-ec2: Creating...
aws_instance.remote-exec-ec2: Still creating... [10s elapsed]
aws_instance.remote-exec-ec2: Still creating... [20s elapsed]
aws_instance.remote-exec-ec2: Still creating... [30s elapsed]
aws_instance.remote-exec-ec2: Provisioning with 'remote-exec'...
aws_instance.remote-exec-ec2 (remote-exec): Connecting to remote host via SSH...
aws_instance.remote-exec-ec2 (remote-exec): Host: 107.23.127.141
aws_instance.remote-exec-ec2 (remote-exec): User: ec2-user
aws_instance.remote-exec-ec2 (remote-exec): Password: false
aws_instance.remote-exec-ec2 (remote-exec): Private key: true
aws_instance.remote-exec-ec2 (remote-exec): Certificate: false
aws_instance.remote-exec-ec2 (remote-exec): SSH Agent: false
aws_instance.remote-exec-ec2 (remote-exec): Checking Host Key: false
aws_instance.remote-exec-ec2 (remote-exec): Target Platform: unix
aws_instance.remote-exec-ec2 (remote-exec): Connected!
aws_instance.remote-exec-ec2 (remote-exec): Amazon --- B/s | 0 B --:-- ETA
aws_instance.remote-exec-ec2 (remote-exec): Amazon --- B/s | 0 B --:-- ETA
aws_instance.remote-exec-ec2 (remote-exec): Amazon 28 MB/s | 24 MB 00:00
aws_instance.remote-exec-ec2: Still creating... [40s elapsed]
aws_instance.remote-exec-ec2 (remote-exec): Amazon --- B/s | 0 B --:-- ETA
aws_instance.remote-exec-ec2: Still creating... [50s elapsed]
aws_instance.remote-exec-ec2 (remote-exec): Amazon --- B/s | 0 B --:-- ETA
aws_instance.remote-exec-ec2 (remote-exec): Amazon 499 kB/s | 165 kB 00:00
aws_instance.remote-exec-ec2 (remote-exec): Dependencies resolved.
aws_instance.remote-exec-ec2 (remote-exec): ========================================
aws_instance.remote-exec-ec2 (remote-exec): Package Arch Version
aws_instance.remote-exec-ec2 (remote-exec): Repository Size
aws_instance.remote-exec-ec2 (remote-exec): ========================================
aws_instance.remote-exec-ec2 (remote-exec): Installing:
aws_instance.remote-exec-ec2 (remote-exec): nginx x86_64 1:1.24.0-1.amzn2023.0.2
aws_instance.remote-exec-ec2 (remote-exec): amazonlinux 32 k
aws_instance.remote-exec-ec2 (remote-exec): Installing dependencies:
aws_instance.remote-exec-ec2 (remote-exec): generic-logos-httpd
aws_instance.remote-exec-ec2 (remote-exec): noarch 18.0.0-12.amzn2023.0.3
aws_instance.remote-exec-ec2 (remote-exec): amazonlinux 19 k
aws_instance.remote-exec-ec2 (remote-exec): gperftools-libs
aws_instance.remote-exec-ec2 (remote-exec): x86_64 2.9.1-1.amzn2023.0.3
aws_instance.remote-exec-ec2 (remote-exec): amazonlinux 308 k
aws_instance.remote-exec-ec2 (remote-exec): libunwind x86_64 1.4.0-5.amzn2023.0.2
aws_instance.remote-exec-ec2 (remote-exec): amazonlinux 66 k
aws_instance.remote-exec-ec2 (remote-exec): nginx-core x86_64 1:1.24.0-1.amzn2023.0.2
aws_instance.remote-exec-ec2 (remote-exec): amazonlinux 586 k
aws_instance.remote-exec-ec2 (remote-exec): nginx-filesystem
aws_instance.remote-exec-ec2 (remote-exec): noarch 1:1.24.0-1.amzn2023.0.2
aws_instance.remote-exec-ec2 (remote-exec): amazonlinux 9.1 k
aws_instance.remote-exec-ec2 (remote-exec): nginx-mimetypes
aws_instance.remote-exec-ec2 (remote-exec): noarch 2.1.49-3.amzn2023.0.3
aws_instance.remote-exec-ec2 (remote-exec): amazonlinux 21 k

aws_instance.remote-exec-ec2 (remote-exec): Transaction Summary
aws_instance.remote-exec-ec2 (remote-exec): ========================================
aws_instance.remote-exec-ec2 (remote-exec): Install 7 Packages

aws_instance.remote-exec-ec2 (remote-exec): Total download size: 1.0 M
aws_instance.remote-exec-ec2 (remote-exec): Installed size: 3.4 M
aws_instance.remote-exec-ec2 (remote-exec): Downloading Packages:
aws_instance.remote-exec-ec2 (remote-exec): Amazon --- B/s | 0 B --:-- ETA
aws_instance.remote-exec-ec2 (remote-exec): (1/7): --- B/s | 0 B --:-- ETA
aws_instance.remote-exec-ec2 (remote-exec): (1/7): 190 kB/s | 19 kB 00:00
aws_instance.remote-exec-ec2 (remote-exec): (2-3/7) 190 kB/s | 19 kB 00:05 ETA
aws_instance.remote-exec-ec2 (remote-exec): (2/7): 638 kB/s | 66 kB 00:00
aws_instance.remote-exec-ec2 (remote-exec): (3-4/7) 203 kB/s | 85 kB 00:04 ETA
aws_instance.remote-exec-ec2 (remote-exec): (3/7): 2.6 MB/s | 308 kB 00:00
aws_instance.remote-exec-ec2 (remote-exec): (4-5/7) 264 kB/s | 393 kB 00:02 ETA
aws_instance.remote-exec-ec2 (remote-exec): (4/7): 1.5 MB/s | 32 kB 00:00
aws_instance.remote-exec-ec2 (remote-exec): (5-6/7) 280 kB/s | 474 kB 00:02 ETA
aws_instance.remote-exec-ec2 (remote-exec): (5/7): 18 MB/s | 586 kB 00:00
aws_instance.remote-exec-ec2 (remote-exec): (6-7/7) 386 kB/s | 1.0 MB 00:00 ETA
aws_instance.remote-exec-ec2 (remote-exec): (6/7): 448 kB/s | 9.1 kB 00:00
aws_instance.remote-exec-ec2 (remote-exec): (7/7): 390 kB/s | 1.0 MB 00:00 ETA
aws_instance.remote-exec-ec2 (remote-exec): (7/7): 1.0 MB/s | 21 kB 00:00
aws_instance.remote-exec-ec2 (remote-exec): ----------------------------------------
aws_instance.remote-exec-ec2 (remote-exec): Total 3.3 MB/s | 1.0 MB 00:00
aws_instance.remote-exec-ec2 (remote-exec): Running transaction check
aws_instance.remote-exec-ec2 (remote-exec): Transaction check succeeded.
aws_instance.remote-exec-ec2 (remote-exec): Running transaction test
aws_instance.remote-exec-ec2 (remote-exec): Transaction test succeeded.
aws_instance.remote-exec-ec2 (remote-exec): Running transaction
aws_instance.remote-exec-ec2 (remote-exec): Preparing : [= ] 1/1
aws_instance.remote-exec-ec2 (remote-exec): Preparing : [=== ] 1/1
aws_instance.remote-exec-ec2 (remote-exec): Preparing : [==== ] 1/1
aws_instance.remote-exec-ec2 (remote-exec): Preparing : [====== ] 1/1
aws_instance.remote-exec-ec2 (remote-exec): Preparing : [======= ] 1/1
aws_instance.remote-exec-ec2 (remote-exec): Preparing : [========= ] 1/1
aws_instance.remote-exec-ec2 (remote-exec): Preparing : 1/1
aws_instance.remote-exec-ec2 (remote-exec): Running scriptlet: nginx-filesy 1/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx [ ] 1/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx [= ] 1/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx [== ] 1/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx [=== ] 1/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx [==== ] 1/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx [===== ] 1/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx-filesy 1/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx [ ] 2/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx [==== ] 2/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx [===== ] 2/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx-mimety 2/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : libun [ ] 3/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : libun [= ] 3/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : libun [=== ] 3/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : libun [==== ] 3/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : libun [===== ] 3/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : libunwind-1. 3/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : gperf [ ] 4/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : gperf [= ] 4/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : gperf [== ] 4/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : gperf [=== ] 4/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : gperf [==== ] 4/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : gperf [===== ] 4/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : gperftools-l 4/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx [ ] 5/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx [= ] 5/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx [== ] 5/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx [=== ] 5/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx [==== ] 5/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx [===== ] 5/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx-core-1 5/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : gener [ ] 6/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : gener [==== ] 6/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : gener [===== ] 6/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : generic-logo 6/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx [ ] 7/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx [== ] 7/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx [=== ] 7/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx [===== ] 7/7
aws_instance.remote-exec-ec2 (remote-exec): Installing : nginx-1:1.24 7/7
aws_instance.remote-exec-ec2 (remote-exec): Running scriptlet: nginx-1:1.24 7/7
aws_instance.remote-exec-ec2 (remote-exec): Verifying : generic-logo 1/7
aws_instance.remote-exec-ec2 (remote-exec): Verifying : gperftools-l 2/7
aws_instance.remote-exec-ec2 (remote-exec): Verifying : libunwind-1. 3/7
aws_instance.remote-exec-ec2 (remote-exec): Verifying : nginx-1:1.24 4/7
aws_instance.remote-exec-ec2 (remote-exec): Verifying : nginx-core-1 5/7
aws_instance.remote-exec-ec2 (remote-exec): Verifying : nginx-filesy 6/7
aws_instance.remote-exec-ec2 (remote-exec): Verifying : nginx-mimety 7/7

aws_instance.remote-exec-ec2 (remote-exec): Installed:
aws_instance.remote-exec-ec2 (remote-exec): generic-logos-httpd-18.0.0-12.amzn2023.0.3.noarch
aws_instance.remote-exec-ec2 (remote-exec): gperftools-libs-2.9.1-1.amzn2023.0.3.x86_64
aws_instance.remote-exec-ec2 (remote-exec): libunwind-1.4.0-5.amzn2023.0.2.x86_64
aws_instance.remote-exec-ec2 (remote-exec): nginx-1:1.24.0-1.amzn2023.0.2.x86_64
aws_instance.remote-exec-ec2 (remote-exec): nginx-core-1:1.24.0-1.amzn2023.0.2.x86_64
aws_instance.remote-exec-ec2 (remote-exec): nginx-filesystem-1:1.24.0-1.amzn2023.0.2.noarch
aws_instance.remote-exec-ec2 (remote-exec): nginx-mimetypes-2.1.49-3.amzn2023.0.3.noarch

aws_instance.remote-exec-ec2 (remote-exec): Complete!
aws_instance.remote-exec-ec2 (remote-exec): Failed to start ngnix.service: Unit ngnix.service not found.
╷
│ Error: remote-exec provisioner error
│
│ with aws_instance.remote-exec-ec2,
│ on My-Example-Usage.tf line 16, in resource "aws_instance" "remote-exec-ec2":
│ 16: provisioner "remote-exec" {
│
│ error executing "/tmp/terraform_378872229.sh": Process exited with status 5
╵
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 5\87 Practical - remote-exec Provisioner> terraform validate
Success! The configuration is valid.

PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 5\87 Practical - remote-exec Provisioner> terraform plan
aws_instance.remote-exec-ec2: Refreshing state... [id=i-0520ae599123da640]

Terraform used the selected providers to generate the following execution plan. Resource actions are  
indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

# aws_instance.remote-exec-ec2 is tainted, so must be replaced

-/+ resource "aws_instance" "remote-exec-ec2" {
~ arn = "arn:aws:ec2:us-east-1:767398044091:instance/i-0520ae599123da640" -> (known after apply)
~ associate_public_ip_address = true -> (known after apply)
~ availability_zone = "us-east-1a" -> (known after apply)
~ cpu_core_count = 1 -> (known after apply)
~ cpu_threads_per_core = 1 -> (known after apply)
~ disable_api_stop = false -> (known after apply)
~ disable_api_termination = false -> (known after apply)
~ ebs_optimized = false -> (known after apply) - hibernation = false -> null + host_id = (known after apply) + host_resource_group_arn = (known after apply) + iam_instance_profile = (known after apply)
~ id = "i-0520ae599123da640" -> (known after apply)
~ instance_initiated_shutdown_behavior = "stop" -> (known after apply) + instance_lifecycle = (known after apply)
~ instance_state = "running" -> (known after apply)
~ ipv6_address_count = 0 -> (known after apply)
~ ipv6_addresses = [] -> (known after apply)
~ monitoring = false -> (known after apply) + outpost_arn = (known after apply) + password_data = (known after apply) + placement_group = (known after apply)
~ placement_partition_number = 0 -> (known after apply)
~ primary_network_interface_id = "eni-0ae5abc3705b78060" -> (known after apply)
~ private_dns = "ip-172-31-21-189.ec2.internal" -> (known after apply)  
 ~ private_ip = "172.31.21.189" -> (known after apply)
~ public_dns = "ec2-107-23-127-141.compute-1.amazonaws.com" -> (known after apply)
~ public_ip = "107.23.127.141" -> (known after apply)
~ secondary_private_ips = [] -> (known after apply)
~ security_groups = [
- "practicing-tfProvisioner-sg",
] -> (known after apply) + spot_instance_request_id = (known after apply)
~ subnet_id = "subnet-010eae5a9f42a9ce7" -> (known after apply) - tags = {} -> null
~ tags_all = {} -> (known after apply)
~ tenancy = "default" -> (known after apply) + user_data = (known after apply) + user_data_base64 = (known after apply) # (7 unchanged attributes hidden)

      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      - cpu_options {
          - core_count       = 1 -> null
          - threads_per_core = 1 -> null
        }

      - credit_specification {
          - cpu_credits = "standard" -> null
        }

      - enclave_options {
          - enabled = false -> null
        }

      - maintenance_options {
          - auto_recovery = "default" -> null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_protocol_ipv6          = "disabled" -> null
          - http_put_response_hop_limit = 2 -> null
          - http_tokens                 = "required" -> null
          - instance_metadata_tags      = "disabled" -> null
        }

      - private_dns_name_options {
          - enable_resource_name_dns_a_record    = false -> null
          - enable_resource_name_dns_aaaa_record = false -> null
          - hostname_type                        = "ip-name" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/xvda" -> null
          - encrypted             = false -> null
          - iops                  = 3000 -> null
          - tags                  = {} -> null
          - tags_all              = {} -> null
          - throughput            = 125 -> null
          - volume_id             = "vol-02514f3035098d009" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp3" -> null
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these
actions if you run "terraform apply" now.
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 5\87 Practical - remote-exec Provisioner> terraform apply -auto-approve
aws_instance.remote-exec-ec2: Refreshing state... [id=i-0520ae599123da640]

Terraform used the selected providers to generate the following execution plan. Resource actions are  
indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

# aws_instance.remote-exec-ec2 is tainted, so must be replaced

-/+ resource "aws_instance" "remote-exec-ec2" {
~ arn = "arn:aws:ec2:us-east-1:767398044091:instance/i-0520ae599123da640" -> (known after apply)
~ associate_public_ip_address = true -> (known after apply)
~ availability_zone = "us-east-1a" -> (known after apply)
~ cpu_core_count = 1 -> (known after apply)
~ cpu_threads_per_core = 1 -> (known after apply)
~ disable_api_stop = false -> (known after apply)
~ disable_api_termination = false -> (known after apply)
~ ebs_optimized = false -> (known after apply) - hibernation = false -> null + host_id = (known after apply) + host_resource_group_arn = (known after apply) + iam_instance_profile = (known after apply)
~ id = "i-0520ae599123da640" -> (known after apply)
~ instance_initiated_shutdown_behavior = "stop" -> (known after apply) + instance_lifecycle = (known after apply)
~ instance_state = "running" -> (known after apply)
~ ipv6_address_count = 0 -> (known after apply)
~ ipv6_addresses = [] -> (known after apply)
~ monitoring = false -> (known after apply) + outpost_arn = (known after apply) + password_data = (known after apply) + placement_group = (known after apply)
~ placement_partition_number = 0 -> (known after apply)
~ primary_network_interface_id = "eni-0ae5abc3705b78060" -> (known after apply)
~ private_dns = "ip-172-31-21-189.ec2.internal" -> (known after apply)  
 ~ private_ip = "172.31.21.189" -> (known after apply)
~ public_dns = "ec2-107-23-127-141.compute-1.amazonaws.com" -> (known after apply)
~ public_ip = "107.23.127.141" -> (known after apply)
~ secondary_private_ips = [] -> (known after apply)
~ security_groups = [
- "practicing-tfProvisioner-sg",
] -> (known after apply) + spot_instance_request_id = (known after apply)
~ subnet_id = "subnet-010eae5a9f42a9ce7" -> (known after apply) - tags = {} -> null
~ tags_all = {} -> (known after apply)
~ tenancy = "default" -> (known after apply) + user_data = (known after apply) + user_data_base64 = (known after apply) # (7 unchanged attributes hidden)

      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      - cpu_options {
          - core_count       = 1 -> null
          - threads_per_core = 1 -> null
        }

      - credit_specification {
          - cpu_credits = "standard" -> null
        }

      - enclave_options {
          - enabled = false -> null
        }

      - maintenance_options {
          - auto_recovery = "default" -> null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_protocol_ipv6          = "disabled" -> null
          - http_put_response_hop_limit = 2 -> null
          - http_tokens                 = "required" -> null
          - instance_metadata_tags      = "disabled" -> null
        }

      - private_dns_name_options {
          - enable_resource_name_dns_a_record    = false -> null
          - enable_resource_name_dns_aaaa_record = false -> null
          - hostname_type                        = "ip-name" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/xvda" -> null
          - encrypted             = false -> null
          - iops                  = 3000 -> null
          - tags                  = {} -> null
          - tags_all              = {} -> null
          - throughput            = 125 -> null
          - volume_id             = "vol-02514f3035098d009" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp3" -> null
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.
aws_instance.remote-exec-ec2: Destroying... [id=i-0520ae599123da640]
aws_instance.remote-exec-ec2: Still destroying... [id=i-0520ae599123da640, 10s elapsed]
aws_instance.remote-exec-ec2: Still destroying... [id=i-0520ae599123da640, 20s elapsed]
aws_instance.remote-exec-ec2: Still destroying... [id=i-0520ae599123da640, 30s elapsed]
aws_instance.remote-exec-ec2: Still destroying... [id=i-0520ae599123da640, 40s elapsed]
aws_instance.remote-exec-ec2: Destruction complete after 41s
aws_instance.remote-exec-ec2: Creating...
aws_instance.remote-exec-ec2: Still creating... [10s elapsed]
aws_instance.remote-exec-ec2: Still creating... [20s elapsed]
aws_instance.remote-exec-ec2: Provisioning with 'remote-exec'...
aws_instance.remote-exec-ec2 (remote-exec): Connecting to remote host via SSH...
aws_instance.remote-exec-ec2 (remote-exec): Host: 18.234.44.26
aws_instance.remote-exec-ec2 (remote-exec): User: ec2-user
aws_instance.remote-exec-ec2 (remote-exec): Password: false
aws_instance.remote-exec-ec2 (remote-exec): Private key: true
aws_instance.remote-exec-ec2 (remote-exec): Certificate: false
aws_instance.remote-exec-ec2 (remote-exec): SSH Agent: false
aws_instance.remote-exec-ec2 (remote-exec): Checking Host Key: false
aws_instance.remote-exec-ec2 (remote-exec): Target Platform: unix
aws_instance.remote-exec-ec2 (remote-exec): Connecting to remote host via SSH...
aws_instance.remote-exec-ec2 (remote-exec): Host: 18.234.44.26
aws_instance.remote-exec-ec2 (remote-exec): User: ec2-user
aws_instance.remote-exec-ec2 (remote-exec): Password: false
aws_instance.remote-exec-ec2 (remote-exec): Private key: true
aws_instance.remote-exec-ec2 (remote-exec): Certificate: false
aws_instance.remote-exec-ec2 (remote-exec): SSH Agent: false
aws_instance.remote-exec-ec2 (remote-exec): Checking Host Key: false
aws_instance.remote-exec-ec2 (remote-exec): Target Platform: unix
aws_instance.remote-exec-ec2 (remote-exec): Connected!
aws_instance.remote-exec-ec2: Still creating... [30s elapsed]
aws_instance.remote-exec-ec2 (remote-exec): Error: This command has to be run with superuser privileges (under the root user on most systems).
aws_instance.remote-exec-ec2 (remote-exec): Failed to start nginx.service: Access denied
aws_instance.remote-exec-ec2 (remote-exec): See system logs and 'systemctl status nginx.service' for details.
╷
│ Error: remote-exec provisioner error
│
│ with aws_instance.remote-exec-ec2,
│ on My-Example-Usage.tf line 16, in resource "aws_instance" "remote-exec-ec2":
│ 16: provisioner "remote-exec" {
│
│ error executing "/tmp/terraform_729208349.sh": Process exited with status 4
╵
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 5\87 Practical - remote-exec Provisioner> terraform validate
