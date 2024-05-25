terraform {
  cloud {
    organization = "mykplabs-org"

    workspaces {
      name = "remote-operation"
    }
  }
}
