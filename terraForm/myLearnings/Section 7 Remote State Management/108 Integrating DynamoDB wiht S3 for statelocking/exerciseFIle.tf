
terraform {
  backend "s3" {
    bucket         = "spnewbucket"
    key            = "network/demo.tfstate" # optional argument # [access Key](https://developer.hashicorp.com/terraform/language/settings/backends/s3#access_key)
    region         = "us-east-1"
    dynamodb_table = "sp-terraform-state-lock-testing"
  }
}


resource "time_sleep" "wait_150_seconds" {

  create_duration = "150s"
}
