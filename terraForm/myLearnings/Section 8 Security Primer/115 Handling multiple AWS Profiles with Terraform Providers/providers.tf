provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias   = "us-west"
  region  = "us-west-1"
  profile = "account02"
}

# basically now this specific resource belongs or it will look into the provider,

# which is "aws.us-west" , and "aws.west" has a different region and has a different profile parameter.

# Now, this profile parameter is "account02" . So within the credentials file.

# It will look into the access key and the secret key associated with the "account02" and it will launch the

# resource within a completely different account.
