C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 10 Terraform Challenges\kplabs-terraform-challenges\challenge-2>terraform plan
╷
│ Error: "domain": this field cannot be set
│
│ with aws_eip.example,
│ on tf-challenge-2.tf line 60, in resource "aws_eip" "example":
│ 60: resource "aws_eip" "example" {
│
╵

C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 10 Terraform Challenges\kplabs-terraform-challenges\challenge-2>terraform init -upgrade

Initializing the backend...

Initializing provider plugins...

- Finding hashicorp/aws versions matching "~> 5.0"...
- Installing hashicorp/aws v5.51.1...
- Installed hashicorp/aws v5.51.1 (signed by HashiCorp)

Terraform has made some changes to the provider dependency selections recorded
in the .terraform.lock.hcl file. Review those changes and commit them to your
version control system if they represent changes you intended to make.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 10 Terraform Challenges\kplabs-terraform-challenges\challenge-2>terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:

- create

Terraform will perform the following actions:

# aws_eip.example will be created

- resource "aws_eip" "example" {
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

# aws_security_group.security_group_payment_app will be created

- resource "aws_security_group" "security_group_payment_app" {
  - arn = (known after apply)
  - description = "Application Security Group"
  - egress = [
    - { + cidr_blocks = [
      + "0.0.0.0/0",
      ] + from_port = 8088 + ipv6_cidr_blocks = [] + prefix_list_ids = [] + protocol = "tcp" + security_groups = [] + self = false + to_port = 8088 # (1 unchanged attribute hidden)
      },
      ]
  - id = (known after apply)
  - ingress = [
    - {
      - cidr_blocks = (known after apply)
      - from_port = 8443
      - ipv6_cidr_blocks = []
      - prefix_list_ids = []
      - protocol = "tcp"
      - security_groups = []
      - self = false
      - to_port = 8443 # (1 unchanged attribute hidden)
        },
    - {
      - cidr_blocks = [
        - "172.31.0.0/16",
          ]
      - from_port = 443
      - ipv6_cidr_blocks = []
      - prefix_list_ids = []
      - protocol = "tcp"
      - security_groups = []
      - self = false
      - to_port = 443 # (1 unchanged attribute hidden)
        },
    - { + cidr_blocks = [
      + "172.31.0.0/16",
      ] + from_port = 8080 + ipv6_cidr_blocks = [] + prefix_list_ids = [] + protocol = "tcp" + security_groups = [] + self = false + to_port = 8080 # (1 unchanged attribute hidden)
      },
      ]
  - name = "payment_app"
  - name_prefix = (known after apply)
  - owner_id = (known after apply)
  - revoke_rules_on_delete = false
  - tags_all = (known after apply)
  - vpc_id = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if
you run "terraform apply" now.

C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 10 Terraform Challenges\kplabs-terraform-challenges\challenge-2>
