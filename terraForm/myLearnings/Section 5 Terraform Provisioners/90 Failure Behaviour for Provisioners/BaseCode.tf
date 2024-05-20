resource "aws_iam_user" "lb" {
  name = "demo-provisioner-user"

  provisioner "local-exec" {
    command = "echo1 This is creation time provisioner"
  }
}
