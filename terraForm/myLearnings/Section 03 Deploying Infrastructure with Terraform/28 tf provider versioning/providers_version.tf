terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# 
# version    = "2.7"
# version    = ">= 2.8"
# version    = "<= 2.8"
# version    = ">=2.10,<=2.30"
