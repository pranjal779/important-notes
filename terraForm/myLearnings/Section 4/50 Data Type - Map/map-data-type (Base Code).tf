variable "my-map" {
  type = map(any)
}

output "variable_value" {
  value = var.my-map
}
