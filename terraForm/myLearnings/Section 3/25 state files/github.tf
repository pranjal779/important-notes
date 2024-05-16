terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = _var.token # or `GITHUB_TOKEN`
}

resource "github_repositry" "example01" {
  name        = "example"
  description = "My awesome codebase"

  visibility = "public"
}
