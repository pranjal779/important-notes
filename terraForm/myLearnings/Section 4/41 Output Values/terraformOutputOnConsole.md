PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 4\41 Output Values> terraform init

Initializing the backend...

Initializing provider plugins...

- Finding latest version of hashicorp/aws...
- Installing hashicorp/aws v5.47.0...
- Installed hashicorp/aws v5.47.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 4\41 Output Values>

PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 4\41 Output Values> terraform plan

Terraform used the selected providers to generate the following execution plan. Resource  
actions are indicated with the following symbols:

- create

Terraform will perform the following actions:

# aws_eip.lb will be created

- resource "aws_eip" "lb" {
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

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:

- public-ip = {
  - address = null
  - allocation_id = (known after apply)
  - arn = (known after apply)
  - associate_with_private_ip = null
  - association_id = (known after apply)
  - carrier_ip = (known after apply)
  - customer_owned_ip = (known after apply)
  - customer_owned_ipv4_pool = null
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
  - tags = null
  - tags_all = (known after apply)
  - timeouts = null
  - vpc = (known after apply)
    }

──────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to  
take exactly these actions if you run "terraform apply" now.
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 4\41 Output Values> terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource  
actions are indicated with the following symbols:

- create

Terraform will perform the following actions:

# aws_eip.lb will be created

- resource "aws_eip" "lb" {
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

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:

- public-ip = { + address = null + allocation_id = (known after apply) + arn = (known after apply) + associate_with_private_ip = null + association_id = (known after apply) + carrier_ip = (known after apply) + customer_owned_ip = (known after apply) + customer_owned_ipv4_pool = null + domain = "vpc" + id = (known after apply) + instance = (known after apply) + network_border_group = (known after apply) + network_interface = (known after apply) + private_dns = (known after apply) + private_ip = (known after apply) + ptr_record = (known after apply) + public_dns = (known after apply) + public_ip = (known after apply) + public_ipv4_pool = (known after apply) + tags = null + tags_all = (known after apply) + timeouts = null + vpc = (known after apply)
  }
  aws_eip.lb: Creating...
  aws_eip.lb: Creation complete after 1s [id=eipalloc-01e00c3df0b9814c7]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

public-ip = {
"address" = tostring(null)
"allocation_id" = "eipalloc-01e00c3df0b9814c7"
"arn" = "arn:aws:ec2:us-east-1:767398044091:elastic-ip/eipalloc-01e00c3df0b9814c7"  
 "associate_with_private_ip" = tostring(null)
"association_id" = ""
"carrier_ip" = ""
"customer_owned_ip" = ""
"customer_owned_ipv4_pool" = ""
"domain" = "vpc"
"id" = "eipalloc-01e00c3df0b9814c7"
"instance" = ""
"network_border_group" = "us-east-1"
"network_interface" = ""
"private_dns" = tostring(null)
"private_ip" = ""
"ptr_record" = ""
"public_dns" = "ec2-3-90-135-110.compute-1.amazonaws.com"
"public_ip" = "3.90.135.110"
"public_ipv4_pool" = "amazon"
"tags" = tomap(null) /_ of string _/
"tags_all" = tomap({})
"timeouts" = null /_ object _/
"vpc" = true
}
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 4\41 Output Values>
