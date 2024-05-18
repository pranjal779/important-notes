Index\new> terraform plan

Terraform used the selected providers to generate the following execution plan. Resource  
actions are indicated with the following symbols:

- create

Terraform will perform the following actions:

# aws_iam_user.lb[0] will be created

- resource "aws_iam_user" "lb" {
  - arn = (known after apply)
  - force_destroy = false
  - id = (known after apply)
  - name = "dev-loadbalancer"
  - path = "/system/"
  - tags_all = (known after apply)
  - unique_id = (known after apply)
    }

# aws_iam_user.lb[1] will be created

- resource "aws_iam_user" "lb" {
  - arn = (known after apply)
  - force_destroy = false
  - id = (known after apply)
  - name = "stage-loadbalancer"
  - path = "/system/"
  - tags_all = (known after apply)
  - unique_id = (known after apply)
    }

# aws_iam_user.lb[2] will be created

- resource "aws_iam_user" "lb" {
  - arn = (known after apply)
  - force_destroy = false
  - id = (known after apply)
  - name = "prod-loadbalancer"
  - path = "/system/"
  - tags_all = (known after apply)
  - unique_id = (known after apply)
    }

Plan: 3 to add, 0 to change, 0 to destroy.
