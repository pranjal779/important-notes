terraform init

terraform plan


# terraform will ignore the default value example for ami id mentioned in variables.tf file
# if a value for ami id is mentioned in terraform.tfvars, terraform will pick the value from
# terraform.tfvars instead of variables.tf

# and if the file name is not terraform.tfvars, the console will ask you that specific value for that specific variables

# so if the file was prod.tfvars
# then run 
terraform plan -var-file="prod.tfvars"

# similarly can be done for either dev environment (dev.tfvars) or prod environment (prod.tfvars)
