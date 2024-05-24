PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 7 Remote State Management\tf\108 Integrating DynamoDB wiht S3 for statelocking> terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource  
actions are indicated with the following symbols:

- create

Terraform will perform the following actions:

# time_sleep.wait_150_seconds will be created

- resource "time_sleep" "wait_150_seconds" {
  - create_duration = "150s"
  - id = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.
time_sleep.wait_150_seconds: Creating...
time_sleep.wait_150_seconds: Still creating... [10s elapsed]
time_sleep.wait_150_seconds: Still creating... [20s elapsed]
time_sleep.wait_150_seconds: Still creating... [30s elapsed]
time_sleep.wait_150_seconds: Still creating... [40s elapsed]
time_sleep.wait_150_seconds: Still creating... [50s elapsed]
time_sleep.wait_150_seconds: Still creating... [1m0s elapsed]
time_sleep.wait_150_seconds: Still creating... [1m10s elapsed]
time_sleep.wait_150_seconds: Still creating... [1m20s elapsed]
time_sleep.wait_150_seconds: Still creating... [1m30s elapsed]
time_sleep.wait_150_seconds: Still creating... [1m40s elapsed]
time_sleep.wait_150_seconds: Still creating... [1m50s elapsed]
time_sleep.wait_150_seconds: Still creating... [2m0s elapsed]
time_sleep.wait_150_seconds: Still creating... [2m10s elapsed]
time_sleep.wait_150_seconds: Still creating... [2m20s elapsed]
time_sleep.wait_150_seconds: Creation complete after 2m30s [id=2024-05-22T18:09:02Z]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 7 Remote State Management\tf\108 Integrating DynamoDB wiht S3 for statelocking>

f\108 Integrating DynamoDB wiht S3 for statelocking> terraform init

Initializing the backend...
╷
│ Error: Backend configuration changed
│
│ A change in the backend configuration has been detected, which may require migrating existing
│ state.
│
│ If you wish to attempt automatic migration of the state, use "terraform init -migrate-state".
│ If you wish to store the current configuration with no changes to the state, use "terraform  
│ init -reconfigure".

PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 7 Remote State Management\tf\108 Integrating DynamoDB wiht S3 for statelocking> terraform init -reconfigure

Initializing the backend...

Successfully configured the backend "s3"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...

- Reusing previous version of hashicorp/time from the dependency lock file
- Using previously-installed hashicorp/time v0.11.1

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 7 Remote State Management\tf\108 Integrating DynamoDB wiht S3 for statelocking> terraform apply -auto-approve
time_sleep.wait_150_seconds: Refreshing state... [id=2024-05-22T18:09:02Z]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no
differences, so no changes are needed.

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 7 Remote State Management\tf\108 Integrating DynamoDB wiht S3 for statelocking>

PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 7 Remote State Management\tf\108 Integrating DynamoDB wiht S3 for statelocking> terraform init

Initializing the backend...
╷
│ Error: Backend configuration changed
│
│ A change in the backend configuration has been detected, which may require migrating existing
│ state.
│
│ If you wish to attempt automatic migration of the state, use "terraform init -migrate-state".
│ If you wish to store the current configuration with no changes to the state, use "terraform  
│ init -reconfigure".
╵

PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 7 Remote State Management\tf\108 Integrating DynamoDB wiht S3 for statelocking> terraform init -reconfigure

Initializing the backend...

Successfully configured the backend "s3"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...

- Reusing previous version of hashicorp/time from the dependency lock file
- Using previously-installed hashicorp/time v0.11.1

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see  
any changes that are required for your infrastructure. All Terraform commands  
should now work.

If you ever set or change modules or backend configuration for Terraform,  
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 7 Remote State Management\tf\108 Integrating DynamoDB wiht S3 for statelocking>

# in a different terminal:

PS C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 7 Remote State Management\tf\108 Integrating DynamoDB wiht S3 for statelocking> terraform plan
time_sleep.wait_150_seconds: Refreshing state... [id=2024-05-22T18:09:02Z]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and
found no differences, so no changes are needed.
