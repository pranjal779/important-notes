terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are  
indicated with the following symbols:

- create

Terraform will perform the following actions:

# aws_instance.myec2 will be created

- resource "aws_instance" "myec2" {
  - ami = "ami-04e5276ebb8451442"
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
  - tags_all = (known after apply)
  - tenancy = (known after apply)
  - user_data = (known after apply)
  - user_data_base64 = (known after apply)
  - user_data_replace_on_change = false
  - vpc_security_group_ids = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.
aws_instance.myec2: Creating...
aws_instance.myec2: Still creating... [10s elapsed]
aws_instance.myec2: Still creating... [20s elapsed]
aws_instance.myec2: Provisioning with 'local-exec'...
aws_instance.myec2 (local-exec): Executing: ["cmd" "/C" "echo 50.19.24.226 >> public_server_ip.txt"]  
aws_instance.myec2: Creation complete after 22s [id=i-0565cb5c605e2ee79]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
