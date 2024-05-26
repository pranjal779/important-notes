C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 10 Terraform Challenges\kplabs-terraform-challenges\challenge-3>terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:

- create

Terraform will perform the following actions:

# aws_instance.ec2_name["instance1"] will be created

- resource "aws_instance" "ec2_name" {
  - ami = "ami-03a6eaae9938c858c"
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
  - key_name = (known after apply)
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
  - tags = {
    - "Name" = "Challenge3 task"
      }
  - tags_all = {
    - "Name" = "Challenge3 task"
      }
  - tenancy = (known after apply)
  - user_data = (known after apply)
  - user_data_base64 = (known after apply)
  - user_data_replace_on_change = false
  - vpc_security_group_ids = (known after apply)
    }

# aws_instance.ec2_name["instance2"] will be created

- resource "aws_instance" "ec2_name" {
  - ami = "ami-053b0d53c279acc90"
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
  - instance_type = "t2.small"
  - ipv6_address_count = (known after apply)
  - ipv6_addresses = (known after apply)
  - key_name = (known after apply)
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
  - tags = {
    - "Name" = "Challenge3 task"
      }
  - tags_all = {
    - "Name" = "Challenge3 task"
      }
  - tenancy = (known after apply)
  - user_data = (known after apply)
  - user_data_base64 = (known after apply)
  - user_data_replace_on_change = false
  - vpc_security_group_ids = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.
aws_instance.ec2_name["instance2"]: Creating...
aws_instance.ec2_name["instance1"]: Creating...
aws_instance.ec2_name["instance1"]: Still creating... [10s elapsed]
aws_instance.ec2_name["instance2"]: Still creating... [10s elapsed]
aws_instance.ec2_name["instance2"]: Still creating... [20s elapsed]
aws_instance.ec2_name["instance1"]: Still creating... [20s elapsed]
aws_instance.ec2_name["instance2"]: Still creating... [30s elapsed]
aws_instance.ec2_name["instance1"]: Still creating... [30s elapsed]
aws_instance.ec2_name["instance2"]: Creation complete after 32s [id=i-0714d4f8336f9dec3]
aws_instance.ec2_name["instance1"]: Creation complete after 32s [id=i-085ba6da0bd7448b4]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 10 Terraform Challenges\kplabs-terraform-challenges\challenge-3>terraform destroy -auto-approve
aws_instance.ec2_name["instance2"]: Refreshing state... [id=i-0714d4f8336f9dec3]
aws_instance.ec2_name["instance1"]: Refreshing state... [id=i-085ba6da0bd7448b4]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:

- destroy

Terraform will perform the following actions:

# aws_instance.ec2_name["instance1"] will be destroyed

- resource "aws_instance" "ec2_name" {

  - ami = "ami-03a6eaae9938c858c" -> null
  - arn = "arn:aws:ec2:us-east-1:767398044091:instance/i-085ba6da0bd7448b4" -> null
  - associate_public_ip_address = true -> null
  - availability_zone = "us-east-1a" -> null
  - cpu_core_count = 1 -> null
  - cpu_threads_per_core = 1 -> null
  - disable_api_stop = false -> null
  - disable_api_termination = false -> null
  - ebs_optimized = false -> null
  - get_password_data = false -> null
  - hibernation = false -> null
  - id = "i-085ba6da0bd7448b4" -> null
  - instance_initiated_shutdown_behavior = "stop" -> null
  - instance_state = "running" -> null
  - instance_type = "t2.micro" -> null
  - ipv6_address_count = 0 -> null
  - ipv6_addresses = [] -> null
  - monitoring = false -> null
  - placement_partition_number = 0 -> null
  - primary_network_interface_id = "eni-02c6020b61f3fadf2" -> null
  - private_dns = "ip-172-31-30-122.ec2.internal" -> null
  - private_ip = "172.31.30.122" -> null
  - public_dns = "ec2-3-80-127-1.compute-1.amazonaws.com" -> null
  - public_ip = "3.80.127.1" -> null
  - secondary_private_ips = [] -> null
  - security_groups = [
    - "default",
      ] -> null
  - source_dest_check = true -> null
  - subnet_id = "subnet-010eae5a9f42a9ce7" -> null
  - tags = {
    - "Name" = "Challenge3 task"
      } -> null
  - tags_all = {
    - "Name" = "Challenge3 task"
      } -> null
  - tenancy = "default" -> null
  - user_data_replace_on_change = false -> null
  - vpc_security_group_ids = [

    - "sg-006d9a7b6e5c8098d",
      ] -> null

    # (8 unchanged attributes hidden)

  - capacity_reservation_specification {

    - capacity_reservation_preference = "open" -> null
      }

  - cpu_options {

    - core_count = 1 -> null
    - threads_per_core = 1 -> null # (1 unchanged attribute hidden)
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

    - http_endpoint = "enabled" -> null
    - http_protocol_ipv6 = "disabled" -> null
    - http_put_response_hop_limit = 2 -> null
    - http_tokens = "required" -> null
    - instance_metadata_tags = "disabled" -> null
      }

  - private_dns_name_options {

    - enable_resource_name_dns_a_record = false -> null
    - enable_resource_name_dns_aaaa_record = false -> null
    - hostname_type = "ip-name" -> null
      }

  - root_block_device { - delete_on_termination = true -> null - device_name = "/dev/xvda" -> null - encrypted = false -> null - iops = 3000 -> null - tags = {} -> null - tags_all = {} -> null - throughput = 125 -> null - volume_id = "vol-0421eceecb78efa86" -> null - volume_size = 8 -> null - volume_type = "gp3" -> null # (1 unchanged attribute hidden)
    }
    }

# aws_instance.ec2_name["instance2"] will be destroyed

- resource "aws_instance" "ec2_name" {

  - ami = "ami-053b0d53c279acc90" -> null
  - arn = "arn:aws:ec2:us-east-1:767398044091:instance/i-0714d4f8336f9dec3" -> null
  - associate_public_ip_address = true -> null
  - availability_zone = "us-east-1d" -> null
  - cpu_core_count = 1 -> null
  - cpu_threads_per_core = 1 -> null
  - disable_api_stop = false -> null
  - disable_api_termination = false -> null
  - ebs_optimized = false -> null
  - get_password_data = false -> null
  - hibernation = false -> null
  - id = "i-0714d4f8336f9dec3" -> null
  - instance_initiated_shutdown_behavior = "stop" -> null
  - instance_state = "running" -> null
  - instance_type = "t2.small" -> null
  - ipv6_address_count = 0 -> null
  - ipv6_addresses = [] -> null
  - monitoring = false -> null
  - placement_partition_number = 0 -> null
  - primary_network_interface_id = "eni-03a2d75793e67b652" -> null
  - private_dns = "ip-172-31-81-128.ec2.internal" -> null
  - private_ip = "172.31.81.128" -> null
  - public_dns = "ec2-54-88-151-149.compute-1.amazonaws.com" -> null
  - public_ip = "54.88.151.149" -> null
  - secondary_private_ips = [] -> null
  - security_groups = [
    - "default",
      ] -> null
  - source_dest_check = true -> null
  - subnet_id = "subnet-024f283a6dda22595" -> null
  - tags = {
    - "Name" = "Challenge3 task"
      } -> null
  - tags_all = {
    - "Name" = "Challenge3 task"
      } -> null
  - tenancy = "default" -> null
  - user_data_replace_on_change = false -> null
  - vpc_security_group_ids = [

    - "sg-006d9a7b6e5c8098d",
      ] -> null

    # (8 unchanged attributes hidden)

  - capacity_reservation_specification {

    - capacity_reservation_preference = "open" -> null
      }

  - cpu_options {

    - core_count = 1 -> null
    - threads_per_core = 1 -> null # (1 unchanged attribute hidden)
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

    - http_endpoint = "enabled" -> null
    - http_protocol_ipv6 = "disabled" -> null
    - http_put_response_hop_limit = 1 -> null
    - http_tokens = "optional" -> null
    - instance_metadata_tags = "disabled" -> null
      }

  - private_dns_name_options {

    - enable_resource_name_dns_a_record = false -> null
    - enable_resource_name_dns_aaaa_record = false -> null
    - hostname_type = "ip-name" -> null
      }

  - root_block_device { - delete_on_termination = true -> null - device_name = "/dev/sda1" -> null - encrypted = false -> null - iops = 100 -> null - tags = {} -> null - tags_all = {} -> null - throughput = 0 -> null - volume_id = "vol-0ca865a594d026b9a" -> null - volume_size = 8 -> null - volume_type = "gp2" -> null # (1 unchanged attribute hidden)
    }
    }

Plan: 0 to add, 0 to change, 2 to destroy.
aws_instance.ec2_name["instance1"]: Destroying... [id=i-085ba6da0bd7448b4]
aws_instance.ec2_name["instance2"]: Destroying... [id=i-0714d4f8336f9dec3]
aws_instance.ec2_name["instance2"]: Still destroying... [id=i-0714d4f8336f9dec3, 10s elapsed]
aws_instance.ec2_name["instance1"]: Still destroying... [id=i-085ba6da0bd7448b4, 10s elapsed]
aws_instance.ec2_name["instance2"]: Still destroying... [id=i-0714d4f8336f9dec3, 20s elapsed]
aws_instance.ec2_name["instance1"]: Still destroying... [id=i-085ba6da0bd7448b4, 20s elapsed]
.
.
.
.

Destroy complete! Resources: 2 destroyed.
