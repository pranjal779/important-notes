terraform init

terraform apply -auto-approve


# Now, one important part that you need to know to make exam perspective is that interacting with vault

# from TerraForm causes any secrets that you read and write to be possessed.

# In both the terraform

# State files so basically reading some secrets as well is passing another service basically those secrets

# will be part of the TerraForm State file.

# So you have to make sure that your TerraForm State file is secured to ensure that the secrets are no

# longer exposed to.