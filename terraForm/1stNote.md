Terraform Core
Terraform Plugins


output format is
resourceName.localName.attributeName


-------------

you can specify a specific Terraform configuration file to plan by providing the file name directly after the terraform plan command. Here's the syntax:

```bash
terraform plan -var-file=<file_name>.tfvars
```
Replace <file_name>.tfvars with the name of the Terraform configuration file you want to use for planning. This command will instruct Terraform to only process the specified configuration file for planning.

Additionally, if you want to specify a .tf file instead of a .tfvars file, you can simply provide the file name without any additional flags:

```bash
terraform plan <file_name>.tf
```
This command will plan the Terraform configuration defined in the specified .tf file.

By using these commands, you can isolate testing to specific Terraform configuration files without processing all files in alphabetical order.
--------------
