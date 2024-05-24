terraform init

terraform apply -auto-approve

# right after this, in second terminal window do a terraform plan
terraform plan
# doing so will/should produce "Error: Error acquiring the state lock"

# tf will create .terraform.tfstate.lock.info

