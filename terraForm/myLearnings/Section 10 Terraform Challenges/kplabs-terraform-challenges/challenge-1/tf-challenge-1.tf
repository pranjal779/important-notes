terraform {
  required_providers {
    # not required for challenge
    # aws = {
    #   version = "~> 2.54"
    # }

    digitalocean = {
      source = "digitalocean/digitalocean"
      #   version = "~> 2.0" # not required
    }
  }
}

provider "aws" {
  region = "us-east-1"
  #   access_key = ""
  #   secret_key = ""
  # access key & secret key already configured
}

# provider "digitalocean/digitalocean" {} # will throw error

# threw a duplicate error when this was not a part of the initial required_provider block, when they were seperate the cli was saying duplicate resource block
# so included them in the initial 1st block
# terraform {
#   required_providers {
#     digitalocean = {
#       source = "digitalocean/digitalocean"
#       #   version = "~> 2.0" # not required
#     }
#   }
# }


# for challenge 9:19 removing the following code:
# terraform {
#   required_version = "0.12.31"
# }


resource "aws_eip" "kplabs_app_ip" {
  domain = "vpc"
  # vpc = true # deprecated

}
