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
      - "0.0.0.0/0",
        ] + from_port = 8088 + ipv6_cidr_blocks = [] + prefix_list_ids = [] + protocol = "tcp" + security_groups = [] + self = false + to_port = 8088 # (1 unchanged attribute hidden)
        },
        ]
  - id = (known after apply)
  - ingress = [
    - {
      - cidr_blocks = (known after apply)
      - from_port = 8843
      - ipv6_cidr_blocks = []
      - prefix_list_ids = []
      - protocol = "tcp"
      - security_groups = []
      - self = false
      - to_port = 8843 # (1 unchanged attribute hidden)
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
      - "172.31.0.0/16",
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

C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 10 Terraform Challenges\kplabs-terraform-challenges\challenge-2>terraform plan -var="splunk=8089" -auto-approve
╷
│ Error: Failed to parse command-line flags
│
│ flag provided but not defined: -auto-approve
╵

For more help on using this command, run:
terraform plan -help

C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 10 Terraform Challenges\kplabs-terraform-challenges\challenge-2>terraform plan -var="splunk=8089"
aws_eip.example: Refreshing state... [id=eipalloc-035a897a71b9f871f]
aws_security_group.security_group_payment_app: Refreshing state... [id=sg-0f06eb49e833de877]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
~ update in-place

Terraform will perform the following actions:

# aws_eip.example will be updated in-place

~ resource "aws_eip" "example" {
id = "eipalloc-035a897a71b9f871f"
~ tags = { + "Env" = "Production" + "Name" = "payment_app" + "Team" = "Payments Teams"
}
~ tags_all = { + "Env" = "Production" + "Name" = "payment_app" + "Team" = "Payments Teams"
} # (16 unchanged attributes hidden)
}

# aws_security_group.security_group_payment_app will be updated in-place

~ resource "aws_security_group" "security_group_payment_app" {
~ egress = [ - { - cidr_blocks = [

- "0.0.0.0/0",
  ] - from_port = 8088 - ipv6_cidr_blocks = [] - prefix_list_ids = [] - protocol = "tcp" - security_groups = [] - self = false - to_port = 8088 # (1 unchanged attribute hidden)
  }, + { + cidr_blocks = [

* "0.0.0.0/0",
  ] + from_port = 8089 + ipv6_cidr_blocks = [] + prefix_list_ids = [] + protocol = "tcp" + security_groups = [] + self = false + to_port = 8089 # (1 unchanged attribute hidden)
  },
  ]
  id = "sg-0f06eb49e833de877"
  name = "payment_app"
  ~ tags = { + "Env" = "Production" + "Name" = "payment_app" + "Team" = "Payments Teams"
  }
  ~ tags_all = { + "Env" = "Production" + "Name" = "payment_app" + "Team" = "Payments Teams"
  } # (7 unchanged attributes hidden)
  }

Plan: 0 to add, 2 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if
you run "terraform apply" now.

C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 10 Terraform Challenges\kplabs-terraform-challenges\challenge-2>

C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 10 Terraform Challenges\kplabs-terraform-challenges\challenge-2>terraform apply -var="splunk=8089" -auto-approve
aws_eip.example: Refreshing state... [id=eipalloc-035a897a71b9f871f]
aws_security_group.security_group_payment_app: Refreshing state... [id=sg-0f06eb49e833de877]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
~ update in-place

Terraform will perform the following actions:

# aws_eip.example will be updated in-place

~ resource "aws_eip" "example" {
id = "eipalloc-035a897a71b9f871f"
~ tags = { + "Env" = "Production" + "Name" = "payment_app" + "Team" = "Payments Teams"
}
~ tags_all = { + "Env" = "Production" + "Name" = "payment_app" + "Team" = "Payments Teams"
} # (16 unchanged attributes hidden)
}

# aws_security_group.security_group_payment_app will be updated in-place

~ resource "aws_security_group" "security_group_payment_app" {
~ egress = [ - { - cidr_blocks = [
- "0.0.0.0/0",
] - from_port = 8088 - ipv6_cidr_blocks = [] - prefix_list_ids = [] - protocol = "tcp" - security_groups = [] - self = false - to_port = 8088 # (1 unchanged attribute hidden)
}, + { + cidr_blocks = [
+ "0.0.0.0/0",
] + from_port = 8089 + ipv6_cidr_blocks = [] + prefix_list_ids = [] + protocol = "tcp" + security_groups = [] + self = false + to_port = 8089 # (1 unchanged attribute hidden)
},
]
id = "sg-0f06eb49e833de877"
name = "payment_app"
~ tags = { + "Env" = "Production" + "Name" = "payment_app" + "Team" = "Payments Teams"
}
~ tags_all = { + "Env" = "Production" + "Name" = "payment_app" + "Team" = "Payments Teams"
} # (7 unchanged attributes hidden)
}

Plan: 0 to add, 2 to change, 0 to destroy.
aws_eip.example: Modifying... [id=eipalloc-035a897a71b9f871f]
aws_eip.example: Modifications complete after 1s [id=eipalloc-035a897a71b9f871f]
aws_security_group.security_group_payment_app: Modifying... [id=sg-0f06eb49e833de877]
aws_security_group.security_group_payment_app: Modifications complete after 1s [id=sg-0f06eb49e833de877]

Apply complete! Resources: 0 added, 2 changed, 0 destroyed.

C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 10 Terraform Challenges\kplabs-terraform-challenges\challenge-2>
