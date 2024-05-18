C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 4\62 Terraform Format>nano test.fmt.tf

C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 4\62 Terraform Format>cat test.fmt.tf
'cat' is not recognized as an internal or external command,
operable program or batch file.

C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 4\62 Terraform Format>more test.fmt.tf
provider "aws" {
region = "us-west-2"
access_key = "YOUR-ACCESS-KEY"
secret_key = "YOUR-SECRET"
version = ">=2.10,<=2.30"
}

resource "aws_instance" "myec2" {
ami = "ami-082b5a644766e0e6f"
instance_type = "t2.micro"
}

C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 4\62 Terraform Format>terraform fmt
test.fmt.tf

C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 4\62 Terraform Format>more test.fmt.tf
provider "aws" {
region = "us-west-2"
access_key = "YOUR-ACCESS-KEY"
secret_key = "YOUR-SECRET"
version = ">=2.10,<=2.30"
}

resource "aws_instance" "myec2" {
ami = "ami-082b5a644766e0e6f"
instance_type = "t2.micro"
}

C:\Users\prath\Desktop\pranjals studies\TerraformLearning\Section 4\62 Terraform Format>
