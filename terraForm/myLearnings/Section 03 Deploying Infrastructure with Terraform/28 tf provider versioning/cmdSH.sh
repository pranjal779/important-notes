terraform init

# after changing the version
terraform init

# .lock file will not allow the change if the .lock.hcl is present

# after removing it
# run the init cmd again
terraform init

# if the terraform.lock.hcl file is blocking the init upgrade to different version you
# pass the following command instead
terraform init -upgrade
# it will go find the latest version and install it and update the lock file as well