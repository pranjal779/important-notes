terraform {
  backend "s3" {
    bucket = "spnewbucket"
    key    = "network/eip.tfstate"
    region = "us-east-1"
  }
}
