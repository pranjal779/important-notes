│
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 5\87 Practical - remote-exec Provisioner> terraform validate
Success! The configuration is valid.

PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 5\87 Practical - remote-exec Provisioner> terraform plan
aws_instance.remote-exec-ec2: Refreshing state... [id=i-05edd7e218988a05e]

Terraform used the selected providers to generate the following execution plan. Resource actions are
indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

# aws_instance.remote-exec-ec2 is tainted, so must be replaced

-/+ resource "aws_instance" "remote-exec-ec2" {
~ arn = "arn:aws:ec2:us-east-1:767398044091:instance/i-05edd7e218988a05e" -> (known after apply)
~ associate_public_ip_address = true -> (known after apply)
~ availability_zone = "us-east-1a" -> (known after apply)
~ cpu_core_count = 1 -> (known after apply)
~ cpu_threads_per_core = 1 -> (known after apply)
~ disable_api_stop = false -> (known after apply)
~ disable_api_termination = false -> (known after apply)
~ ebs_optimized = false -> (known after apply) - hibernation = false -> null + host_id = (known after apply) + host_resource_group_arn = (known after apply) + iam_instance_profile = (known after apply)
~ id = "i-05edd7e218988a05e" -> (known after apply)
~ instance_initiated_shutdown_behavior = "stop" -> (known after apply) + instance_lifecycle = (known after apply)
~ instance_state = "running" -> (known after apply)
~ ipv6_address_count = 0 -> (known after apply)
~ ipv6_addresses = [] -> (known after apply)
~ monitoring = false -> (known after apply) + outpost_arn = (known after apply) + password_data = (known after apply) + placement_group = (known after apply)
~ placement_partition_number = 0 -> (known after apply)
~ primary_network_interface_id = "eni-0e8492cfffb7b2357" -> (known after apply)
~ private_dns = "ip-172-31-29-99.ec2.internal" -> (known after apply)  
 ~ private_ip = "172.31.29.99" -> (known after apply)
~ public_dns = "ec2-18-234-44-26.compute-1.amazonaws.com" -> (known after apply)
~ public_ip = "18.234.44.26" -> (known after apply)
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
            - volume_id             = "vol-02db3307a2f26e6a9" -> null
            - volume_size           = 8 -> null
            - volume_type           = "gp3" -> null
          }
      }

Plan: 1 to add, 0 to change, 1 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these
actions if you run "terraform apply" now.
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 5\87 Practical - remote-exec Provisioner> terraform apply -auto-approve
aws_instance.remote-exec-ec2: Refreshing state... [id=i-05edd7e218988a05e]

Terraform used the selected providers to generate the following execution plan. Resource actions are  
indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

# aws_instance.remote-exec-ec2 is tainted, so must be replaced

-/+ resource "aws_instance" "remote-exec-ec2" {
~ arn = "arn:aws:ec2:us-east-1:767398044091:instance/i-05edd7e218988a05e" -> (known after apply)
~ associate_public_ip_address = true -> (known after apply)
~ availability_zone = "us-east-1a" -> (known after apply)
~ cpu_core_count = 1 -> (known after apply)
~ cpu_threads_per_core = 1 -> (known after apply)
~ disable_api_stop = false -> (known after apply)
~ disable_api_termination = false -> (known after apply)
~ ebs_optimized = false -> (known after apply) - hibernation = false -> null + host_id = (known after apply) + host_resource_group_arn = (known after apply) + iam_instance_profile = (known after apply)
~ id = "i-05edd7e218988a05e" -> (known after apply)
~ instance_initiated_shutdown_behavior = "stop" -> (known after apply) + instance_lifecycle = (known after apply)
~ instance_state = "running" -> (known after apply)
~ ipv6_address_count = 0 -> (known after apply)
~ ipv6_addresses = [] -> (known after apply)
~ monitoring = false -> (known after apply) + outpost_arn = (known after apply) + password_data = (known after apply) + placement_group = (known after apply)
~ placement_partition_number = 0 -> (known after apply)
~ primary_network_interface_id = "eni-0e8492cfffb7b2357" -> (known after apply)
~ private_dns = "ip-172-31-29-99.ec2.internal" -> (known after apply)  
 ~ private_ip = "172.31.29.99" -> (known after apply)
~ public_dns = "ec2-18-234-44-26.compute-1.amazonaws.com" -> (known after apply)
~ public_ip = "18.234.44.26" -> (known after apply)
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
            - volume_id             = "vol-02db3307a2f26e6a9" -> null
            - volume_size           = 8 -> null
            - volume_type           = "gp3" -> null
          }
      }

Plan: 1 to add, 0 to change, 1 to destroy.
aws_instance.remote-exec-ec2: Destroying... [id=i-05edd7e218988a05e]
aws_instance.remote-exec-ec2: Still destroying... [id=i-05edd7e218988a05e, 10s elapsed]
aws_instance.remote-exec-ec2: Still destroying... [id=i-05edd7e218988a05e, 20s elapsed]
aws_instance.remote-exec-ec2: Still destroying... [id=i-05edd7e218988a05e, 30s elapsed]
aws_instance.remote-exec-ec2: Still destroying... [id=i-05edd7e218988a05e, 40s elapsed]
aws_instance.remote-exec-ec2: Destruction complete after 40s
aws_instance.remote-exec-ec2: Creating...
aws_instance.remote-exec-ec2: Still creating... [10s elapsed]
aws_instance.remote-exec-ec2: Still creating... [20s elapsed]
aws_instance.remote-exec-ec2: Still creating... [30s elapsed]
aws_instance.remote-exec-ec2: Provisioning with 'remote-exec'...
aws_instance.remote-exec-ec2 (remote-exec): Connecting to remote host via SSH...
aws_instance.remote-exec-ec2 (remote-exec): Host: 34.230.17.44
aws_instance.remote-exec-ec2 (remote-exec): User: ec2-user
aws_instance.remote-exec-ec2 (remote-exec): Password: false
aws_instance.remote-exec-ec2 (remote-exec): Private key: true
aws_instance.remote-exec-ec2 (remote-exec): Certificate: false
aws_instance.remote-exec-ec2 (remote-exec): SSH Agent: false
aws_instance.remote-exec-ec2 (remote-exec): Checking Host Key: false
aws_instance.remote-exec-ec2 (remote-exec): Target Platform: unix
aws_instance.remote-exec-ec2 (remote-exec): Connected!
aws_instance.remote-exec-ec2 (remote-exec): Amazon --- B/s | 0 B --:-- ETA
aws_instance.remote-exec-ec2 (remote-exec): Amazon 1.1 MB/s | 347 kB 00:03 ETA
aws_instance.remote-exec-ec2 (remote-exec): Amazon 31 MB/s | 24 MB 00:00
aws_instance.remote-exec-ec2: Still creating... [41s elapsed]
aws_instance.remote-exec-ec2 (remote-exec): Amazon --- B/s | 0 B --:-- ETA
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
aws_instance.remote-exec-ec2 (remote-exec): (1/7): 640 kB/s | 66 kB 00:00
aws_instance.remote-exec-ec2 (remote-exec): (2-3/7) 638 kB/s | 66 kB 00:01 ETA
aws_instance.remote-exec-ec2 (remote-exec): (2/7): 177 kB/s | 19 kB 00:00
aws_instance.remote-exec-ec2 (remote-exec): (3-4/7) 641 kB/s | 85 kB 00:01 ETA
aws_instance.remote-exec-ec2 (remote-exec): (3/7): 2.5 MB/s | 308 kB 00:00
aws_instance.remote-exec-ec2 (remote-exec): (4-5/7) 701 kB/s | 393 kB 00:00 ETA
aws_instance.remote-exec-ec2 (remote-exec): (4/7): 1.7 MB/s | 32 kB 00:00
aws_instance.remote-exec-ec2 (remote-exec): (5-6/7) 708 kB/s | 425 kB 00:00 ETA
aws_instance.remote-exec-ec2 (remote-exec): (5/7): 476 kB/s | 9.1 kB 00:00
aws_instance.remote-exec-ec2 (remote-exec): (6-7/7) 816 kB/s | 981 kB 00:00 ETA
aws_instance.remote-exec-ec2 (remote-exec): (6/7): 1.1 MB/s | 21 kB 00:00
aws_instance.remote-exec-ec2 (remote-exec): (7/7): 816 kB/s | 981 kB 00:00 ETA
aws_instance.remote-exec-ec2 (remote-exec): (7/7): 13 MB/s | 586 kB 00:00
aws_instance.remote-exec-ec2 (remote-exec): ----------------------------------------
aws_instance.remote-exec-ec2 (remote-exec): Total 4.1 MB/s | 1.0 MB 00:00
aws_instance.remote-exec-ec2 (remote-exec): Running transaction check
aws_instance.remote-exec-ec2 (remote-exec): Transaction check succeeded.
aws_instance.remote-exec-ec2 (remote-exec): Running transaction test
aws_instance.remote-exec-ec2 (remote-exec): Transaction test succeeded.
aws_instance.remote-exec-ec2 (remote-exec): Running transaction
aws_instance.remote-exec-ec2: Still creating... [51s elapsed]
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
aws_instance.remote-exec-ec2: Creation complete after 53s [id=i-05c490cdc4dda7572]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 5\87 Practical - remote-exec Provisioner>
.
.
.
.
Destroy complete! Resources: 1 destroyed.
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 5\87 Practical - remote-exec Provisioner>
