```
Question 14
Incorrect
Which Terraform files should be ignored by Git when committing code to a repository? (Choose Three)

 input.tf 

Your selection is incorrect
output.tf

Your selection is correct
Files named exactly terraform.tfvars or terraform.tfvars.json.

Your selection is correct
terraform.tfstate

Correct selection
Any files with names ending in .auto.tfvars or .auto.tfvars.json.

Overall explanation
.tfvars files, which are likely to contain sensitive data, such as passwords, private keys, and other secrets. 
These should not be part of version control as they are data points that are potentially sensitive 
and subject to change depending on the environment.

Along with this, even tfstate files should not be committed. 
It can contain sensitive data. Instead, it is recommended to have tfstate to a remote backend.
```

When considering which files to ignore when committing Terraform code to a repository, the main focus is on files that either contain sensitive information or are auto-generated and specific to the current state of the Terraform environment. Let's break down why certain files should or should not be ignored.

### Files That Should Be Ignored

1. **`terraform.tfstate`**:
   - **Reason**: The state file (`terraform.tfstate`) contains detailed information about the infrastructure, including potentially sensitive data like resource IDs, configuration details, and even secrets. Exposing this file can lead to security risks and accidental misconfigurations.

2. **`.tfvars` files**:
   - **Reason**: Files named exactly `terraform.tfvars` or `terraform.tfvars.json` and files with names ending in `.auto.tfvars` or `.auto.tfvars.json` are used to set variable values. These files often contain sensitive data such as passwords, private keys, and other secrets that should not be stored in version control to avoid exposing sensitive information.

3. **`.terraform` directory**:
   - **Reason**: This directory is used by Terraform to store its local cache and plugin binaries. It is auto-generated and should not be committed to version control.

### File That Should Not Be Ignored (Like `output.tf`)

**`output.tf`**:
- **Reason**: The `output.tf` file is part of your Terraform configuration and contains the definitions of output variables. It does not contain sensitive data directly but rather references outputs that can be used elsewhere in the Terraform configuration or provided to other systems. The `output.tf` file itself does not store values, only the structure of outputs. Sensitive information should be handled carefully within the configuration and state files, not within the `output.tf` file itself.

### Why `output.tf` is the Wrong Answer

- **Structure vs. Content**: The `output.tf` file defines the outputs of your Terraform configuration but does not hold the actual sensitive data. The values for these outputs are determined during the Terraform execution and stored in the state file. Therefore, including `output.tf` in version control is important for maintaining the structure and configuration of the Terraform setup.
- **Non-sensitive Configuration**: While the outputs may reference sensitive data, the `output.tf` file itself does not store these values directly. It simply defines what should be outputted and how, without including the sensitive data within the file itself.

### Correct Files to Ignore in Git

1. **`terraform.tfstate`**
2. **`.tfvars` files**
3. **`.terraform` directory**

These files contain sensitive data or are auto-generated and specific to the local environment, making them unsuitable for version control.

### Example `.gitignore` for Terraform

```plaintext
# Local .terraform directories
**/.terraform/*

# .tfstate files
*.tfstate
*.tfstate.*

# .tfvars files
*.tfvars
*.tfvars.json
*.auto.tfvars
*.auto.tfvars.json

# Crash log files
crash.log

# Ignore override files as they are usually used to override resources for a specific environment
override.tf
override.tf.json
*_override.tf
*_override.tf.json

# Include a local version of override files
.terraformrc
terraform.rc
```

By following these guidelines, you can ensure that sensitive information and auto-generated files do not get committed to version control, while keeping essential configuration files like `output.tf` in the repository.


```
we can cannot put the json files or tfvars files in a public repository
so how do they maintain them
how do individual employee who is create terraform files, with say these files and has some sentitive data like IDs password etc, how does he store them, does he not upload them?
how will other team members get access resource created if they need the same password, for accessing these said resource
```


Managing sensitive data in Terraform configurations is crucial for maintaining security while enabling team collaboration. Here's how organizations typically handle sensitive data and ensure team members have access to necessary resources without exposing sensitive information:

### Best Practices for Handling Sensitive Data

1. **Use Environment Variables**:
   - Sensitive data can be stored in environment variables, which Terraform can read at runtime. This keeps sensitive information out of version control.
   - Example:
     ```bash
     export AWS_ACCESS_KEY_ID="your-access-key-id"
     export AWS_SECRET_ACCESS_KEY="your-secret-access-key"
     ```

2. **Terraform Cloud/Enterprise Variables**:
   - Terraform Cloud and Terraform Enterprise allow you to store sensitive variables securely. These variables can be encrypted and are not exposed in the state file.
   - Example:
     - Go to your workspace settings in Terraform Cloud, and under "Variables," add your sensitive variables and mark them as sensitive.

3. **Remote State Storage**:
   - Use remote state storage (e.g., S3 with encryption, Terraform Cloud) to securely store the state file. This ensures that the state file is not stored locally or committed to version control.
   - Example:
     ```hcl
     terraform {
       backend "s3" {
         bucket         = "your-terraform-state-bucket"
         key            = "path/to/terraform.tfstate"
         region         = "us-east-1"
         dynamodb_table = "terraform-locks"
         encrypt        = true
       }
     }
     ```

4. **Use Secrets Management Tools**:
   - Tools like HashiCorp Vault, AWS Secrets Manager, Azure Key Vault, or GCP Secret Manager can store and manage sensitive data. Terraform can integrate with these tools to retrieve secrets dynamically.
   - Example:
     ```hcl
     provider "vault" {
       address = "https://vault.example.com"
     }

     data "vault_generic_secret" "example" {
       path = "secret/data/example"
     }

     output "example_secret" {
       value = data.vault_generic_secret.example.data["example"]
     }
     ```

5. **.gitignore Sensitive Files**:
   - Add `.tfvars` files and other sensitive files to your `.gitignore` to prevent them from being committed to the repository.
   - Example `.gitignore`:
     ```plaintext
     *.tfstate
     *.tfstate.*
     *.tfvars
     *.tfvars.json
     .terraform/
     crash.log
     ```

6. **Use Terraform `.auto.tfvars` Files Securely**:
   - For sensitive data that needs to be versioned, use encrypted storage solutions like S3 buckets with server-side encryption and restrict access using IAM policies.

### How to Share Sensitive Data Among Team Members

1. **Shared Secrets Management**:
   - Use a central secrets management tool (e.g., HashiCorp Vault) that team members can access to retrieve the sensitive information they need.
   - Example:
     - Store the secret in Vault and provide access policies to team members. Team members can then use the Vault provider in Terraform to fetch these secrets.

2. **Terraform Cloud Workspaces**:
   - Store sensitive variables in Terraform Cloud workspaces. Team members who have access to the workspace can use these variables in their Terraform runs.
   - Example:
     - Define a sensitive variable in the Terraform Cloud workspace settings, which can then be referenced in the Terraform code.

3. **Environment Configuration**:
   - Team members can configure their local environment with necessary environment variables. Use tools like direnv or dotenv to manage environment variables for different projects.
   - Example:
     - Create a `.env` file with sensitive information and use a tool to load these variables into the environment.

### Example Workflow

1. **Environment Variables**:
   - Each team member sets their environment variables locally.
   - `export DB_PASSWORD="supersecret"`

2. **Secrets Management**:
   - Store sensitive data in Vault.
   - `vault write secret/dbpassword value=supersecret`

3. **Terraform Configuration**:
   - Configure Terraform to read the secret.
   ```hcl
   data "vault_generic_secret" "db_password" {
     path = "secret/dbpassword"
   }

   resource "aws_db_instance" "example" {
     ...
     password = data.vault_generic_secret.db_password.data["value"]
   }
   ```

### Summary

By using environment variables, remote state storage, secrets management tools, and Terraform Cloud, you can securely manage sensitive data in Terraform configurations. These practices ensure that sensitive information is not exposed in version control while still enabling collaboration among team members.
