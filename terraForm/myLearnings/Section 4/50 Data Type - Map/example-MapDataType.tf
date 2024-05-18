variable "instance_tages" {
  type = map(any)
  default = {
    Name        = "app-server"
    Environment = "development"
    Team        = "payments"
  }
}
