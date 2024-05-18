variable "my-list-practice" {
  type = list(any)
}

output "variable_value" {
  value = [var.my-list-practice, var.my-numbered-list]
}
