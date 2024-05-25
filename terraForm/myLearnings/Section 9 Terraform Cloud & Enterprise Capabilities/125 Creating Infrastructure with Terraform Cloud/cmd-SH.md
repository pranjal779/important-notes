Manually destroy  
Queuing a destroy plan will redirect to a new plan that will destroy all of the infrastructure managed by Terraform. It is equivalent to running terraform plan -destroy -out=destroy.tfplan followed by terraform apply destroy.tfplan locally.

```sh
terraform plan -destroy -out=destroy.tfplan

terraform apply destroy.tfplan

```

[Test Repo for Terraform cloud](https://github.com/pranjal779/TerraformCloud-Repo)

# be carefull of the region of the ami you will have to change to that specific region in the AWS console to check if the instances is created or not
