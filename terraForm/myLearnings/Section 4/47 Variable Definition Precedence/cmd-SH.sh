terraform plan -var="instancetype=t2.small"

# either of these for testing the Variables precedence

terraform plan

terraform apply -auto-approve