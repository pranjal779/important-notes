variable "my-map" {
  type = map(any)
  default = {
    Name = "Alice"
    Team = "Payments"
  }
}

output "variable_value" {
  value = var.my-map
}
