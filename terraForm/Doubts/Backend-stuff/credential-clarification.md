need help with terraform lesson
zeal vora udemy terraform
video 108 Integrating DynamoDB wiht S3 for statelocking

my code in exerciseFile.tf


terraform {
  backend "s3" {
    bucket = "spnewbucket"
    key    = "network/demo.tfstate" # optional argument # [access Key](https://developer.hashicorp.com/terraform/language/settings/backends/s3#access_key)
    region = "us-east-1"
    # dynamodb_table = "terraform-state-locking"
  }
}


resource "time_sleep" "wait_150_seconds" {

  create_duration = "150s"
}

in the documentation there is mentioned

access_key - (Optional) AWS access key. If configured, must also configure secret_key. This can also be sourced from the AWS_ACCESS_KEY_ID environment variable, AWS shared credentials file (e.g. ~/.aws/credentials), or AWS shared configuration file (e.g. ~/.aws/config).

i have configure my aws credentials in cli config

now my question is the code
do i have to share my credentials again in the path of the key? again?
or i can skip it using the ~/.aws/config or  ~/.aws/credentials

as per what i understand .tfstate file will show my password

i do not want that to happen
please teach me if I have gotten the wrong impression
and please teach the what I need to understand here
and please tell what I should do

-----

You have the right understanding about avoiding hardcoding sensitive information like AWS credentials directly in your Terraform configuration files. It's generally not a good practice to include sensitive credentials in your `.tf` files, as these can be inadvertently shared or exposed.

### Using AWS CLI Configuration

Since you've already configured your AWS credentials using the AWS CLI, you do not need to specify `access_key` and `secret_key` in your Terraform configuration. Terraform can automatically use the credentials stored in `~/.aws/credentials` or `~/.aws/config`.

Here's what you need to do:

1. **Ensure your AWS CLI is configured:**

   Make sure you've run `aws configure` and set your credentials properly. This stores your AWS credentials in `~/.aws/credentials`.

   ```sh
   aws configure
   ```

   This command will prompt you to enter your AWS Access Key ID, Secret Access Key, region, and output format.

2. **Terraform Configuration:**

   You can omit the `access_key` and `secret_key` from your `backend` configuration. Terraform will automatically pick up the credentials from the AWS CLI configuration.

   ```hcl
   terraform {
     backend "s3" {
       bucket = "spnewbucket"
       key    = "network/demo.tfstate"
       region = "us-east-1"
       dynamodb_table = "terraform-state-locking"  # Uncomment and use if you have a DynamoDB table for state locking
     }
   }

   resource "time_sleep" "wait_150_seconds" {
     create_duration = "150s"
   }
   ```

### How Terraform Uses Credentials

When Terraform runs, it uses the AWS provider to communicate with AWS services. If no credentials are specified in the Terraform configuration, the AWS provider will look for credentials in the following order:

1. **Environment Variables:**
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `AWS_SESSION_TOKEN` (if using temporary credentials)

2. **Shared Credentials File:**
   - Typically located at `~/.aws/credentials`

3. **Shared Configuration File:**
   - Typically located at `~/.aws/config`

4. **EC2 Instance Metadata:**
   - If running Terraform from an EC2 instance, it can use the instance profile credentials.

### Example Workflow

Here is the workflow you should follow:

1. **Configure AWS CLI:**

   ```sh
   aws configure
   ```

2. **Write Terraform Configuration:**

   Make sure your `terraform` block in your `.tf` file looks like this:

   ```hcl
   terraform {
     backend "s3" {
       bucket = "spnewbucket"
       key    = "network/demo.tfstate"
       region = "us-east-1"
       dynamodb_table = "terraform-state-locking"
     }
   }

   resource "time_sleep" "wait_150_seconds" {
     create_duration = "150s"
   }
   ```

3. **Initialize Terraform:**

   Run `terraform init` to initialize your configuration. Terraform will automatically use the credentials configured via the AWS CLI.

   ```sh
   terraform init
   ```

By following this approach, your credentials remain secure, and you avoid hardcoding sensitive information in your Terraform files. Terraform will use the credentials stored in the AWS CLI configuration, which is a more secure and recommended practice.
