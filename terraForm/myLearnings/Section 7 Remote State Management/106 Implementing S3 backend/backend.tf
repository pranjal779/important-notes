terraform {
  backend "s3" {
    bucket = "spnewbucket"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}
