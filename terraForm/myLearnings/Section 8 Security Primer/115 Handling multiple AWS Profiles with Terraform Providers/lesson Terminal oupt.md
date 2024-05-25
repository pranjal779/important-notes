PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 8 Security Primer\114 Terraform Provider UseCase - Resources in Multiple Regions> terraform init

Initializing the backend...
Terraform encountered problems during initialisation, including problems
with the configuration, described below.

The Terraform configuration must be valid before initialization so that
Terraform can determine which modules and providers need to be installed.
╷
│ Error: Duplicate provider configuration
│
│ on providers.tf line 5:
│ 5: provider "aws" {
│
│ A default (non-aliased) provider configuration for "aws" was already given at  
│ providers.tf:1,1-15. If multiple configurations are required, set the "alias"  
│ argument for alternative configurations.
╵

╷
│ Error: Duplicate provider configuration
│
│ on providers.tf line 5:
│ 5: provider "aws" {
│
│ A default (non-aliased) provider configuration for "aws" was already given at  
│ providers.tf:1,1-15. If multiple configurations are required, set the "alias"  
│ argument for alternative configurations.
╵

PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 8 Security Primer\114 Terraform Provider UseCase - Resources in Multiple Regions>

# when i added - alias = "us-west":

```
provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "us-west"
  region = "us-west-1"
}
```

# in the providers.tf file

# Terraform has been successfully initialized!

> terraform plan

Terraform used the selected providers to generate the following execution plan.  
Resource actions are indicated with the following symbols:

- create

Terraform will perform the following actions:

# aws_eip.myeip_01 will be created

- resource "aws_eip" "myeip_01" {
  - allocation_id = (known after apply)
  - arn = (known after apply)
  - association_id = (known after apply)
  - carrier_ip = (known after apply)
  - customer_owned_ip = (known after apply)
  - domain = "vpc"
  - id = (known after apply)
  - instance = (known after apply)
  - network_border_group = (known after apply)
  - network_interface = (known after apply)
  - private_dns = (known after apply)
  - private_ip = (known after apply)
  - ptr_record = (known after apply)
  - public_dns = (known after apply)
  - public_ip = (known after apply)
  - public_ipv4_pool = (known after apply)
  - tags_all = (known after apply)
  - vpc = (known after apply)
    }

# aws_eip.myeip_02 will be created

- resource "aws_eip" "myeip_02" {
  - allocation_id = (known after apply)
  - arn = (known after apply)
  - association_id = (known after apply)
  - carrier_ip = (known after apply)
  - customer_owned_ip = (known after apply)
  - domain = "vpc"
  - id = (known after apply)
  - instance = (known after apply)
  - network_border_group = (known after apply)
  - network_interface = (known after apply)
  - private_dns = (known after apply)
  - private_ip = (known after apply)
  - ptr_record = (known after apply)
  - public_dns = (known after apply)
  - public_ip = (known after apply)
  - public_ipv4_pool = (known after apply)
  - tags_all = (known after apply)
  - vpc = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee  
to take exactly these actions if you run "terraform apply" now.

> terraform destroy -auto-approve
> aws_eip.myeip_02: Refreshing state... [id=eipalloc-0fabf4c635343690a]
> aws_eip.myeip_01: Refreshing state... [id=eipalloc-0487518e35aef1e0b]

Terraform used the selected providers to generate the following execution plan.  
Resource actions are indicated with the following symbols:

- destroy

Terraform will perform the following actions:

# aws_eip.myeip_01 will be destroyed

- resource "aws_eip" "myeip_01" {
  - allocation_id = "eipalloc-0487518e35aef1e0b" -> null
  - arn = "arn:aws:ec2:us-east-1:767398044091:elastic-ip/eipalloc-0487518e35aef1e0b" -> null
  - domain = "vpc" -> null
  - id = "eipalloc-0487518e35aef1e0b" -> null
  - network_border_group = "us-east-1" -> null
  - public_dns = "ec2-52-73-172-197.compute-1.amazonaws.com" -> null
  - public_ip = "52.73.172.197" -> null
  - public_ipv4_pool = "amazon" -> null
  - tags = {} -> null
  - tags_all = {} -> null
  - vpc = true -> null
    }

# aws_eip.myeip_02 will be destroyed

- resource "aws_eip" "myeip_02" {
  - allocation_id = "eipalloc-0fabf4c635343690a" -> null
  - arn = "arn:aws:ec2:us-east-1:767398044091:elastic-ip/eipalloc-0fabf4c635343690a" -> null
  - domain = "vpc" -> null
  - id = "eipalloc-0fabf4c635343690a" -> null
  - network_border_group = "us-east-1" -> null
  - public_dns = "ec2-3-210-251-52.compute-1.amazonaws.com" -> null
  - public_ip = "3.210.251.52" -> null
  - public_ipv4_pool = "amazon" -> null
  - tags = {} -> null
  - tags_all = {} -> null
  - vpc = true -> null
    }

Plan: 0 to add, 0 to change, 2 to destroy.
aws_eip.myeip_01: Destroying... [id=eipalloc-0487518e35aef1e0b]
aws_eip.myeip_02: Destroying... [id=eipalloc-0fabf4c635343690a]
aws_eip.myeip_02: Destruction complete after 1s
aws_eip.myeip_01: Destruction complete after 1s

Destroy complete! Resources: 2 destroyed.
PS C:\Users\prath\Desktop\pranjals studie
