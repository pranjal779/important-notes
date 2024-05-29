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
