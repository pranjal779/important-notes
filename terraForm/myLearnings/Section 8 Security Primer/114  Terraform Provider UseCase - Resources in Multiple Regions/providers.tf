provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "us-west"
  region = "us-west-1"
}
