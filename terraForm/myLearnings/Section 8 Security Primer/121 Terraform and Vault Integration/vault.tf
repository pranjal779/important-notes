provider "vault" {
  address = "http://127.0.0.1:8200"
}

data "vault_generic_secret" "demo-case" {
  path = "secret/db-creds"
}

output "vault_secret" {
  value     = data.vault_generic_secret.demo-case.data_json
  sensitive = "true"
}
