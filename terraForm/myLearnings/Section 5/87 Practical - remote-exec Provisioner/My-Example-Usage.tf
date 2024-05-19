resource "aws_instance" "remote-exec-ec2" {
  ami                    = "ami-0bb84b8ffd87024d8"
  instance_type          = "t2.micro"
  key_name               = "PEM-Private-spArchie-key"
  vpc_security_group_ids = ["sg-08faea0f199735865"]

  # Establishes connection to be used by all
  # generic remote provisioners (i.e. file/remote-exec)
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./PEM-Private-spArchie-key.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      # with sudo privileges
      "sudo yum -y install nginx",
      "sudo systemctl start nginx",
      # "yum -y install nginx",  # these both provide error # only works in linux system
      # "systemctl start nginx", # and these
      #   "puppet apply",
      #   "consul join ${aws_instance.web.private_ip}",
    ]
  }
}
