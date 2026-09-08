To manage more than two AWS regions (us-east-1, us-east-2, and us-west-1) in Terraform, you must define aliased provider blocks because Terraform requires explicit provider configurations for each separate region. 

Amazon Web Services (AWS) +2
Here is how to set them up using variables.tf and providers.tf.

1. variable.tf
   Define individual variables for each region so you can override them via environment variables or a terraform.tfvars file if needed. (ControlMonkey)

   ```hcl
    variable "aws_region_primary" {
    type        = string
    description = "Primary AWS Region"
    default     = "us-east-1"
    }
    
    variable "aws_region_secondary" {
    type        = string
    description = "Secondary AWS Region"
    default     = "us-east-2"
    }
    
    variable "aws_region_tertiary" {
    type        = string
    description = "Tertiary AWS Region"
    default     = "us-west-1"
    }

   ```

2. providers.tf
Configure the standard required providers block and declare one default provider plus additional aliased providers for your extra regions. 

HashiCorp Discuss +1

  ```hcl
    terraform {
      required_version = ">= 1.0.0"
      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "~> 5.0"
        }
      }
    }
    
    # Default provider (us-east-1)
    provider "aws" {
      region = var.aws_region_primary
    }
    
    # Aliased provider for us-east-2
    provider "aws" {
      alias  = "east_2"
      region = var.aws_region_secondary
    }
    
    # Aliased provider for us-west-1
    provider "aws" {
      alias  = "west_1"
      region = var.aws_region_tertiary
    }
  
  ```

3. How to Use Them in Resources (main.tf)
To deploy a resource to a specific region, use the provider meta-argument inside your resource block. If you omit the provider argument, Terraform uses the default provider (us-east-1). 

YouTube ·WORLD OF AWS +2

```hcl

# Created in us-east-1 (Default)
resource "aws_s3_bucket" "bucket_east_1" {
  bucket = "my-bucket-us-east-1-xyz"
}

# Created in us-east-2
resource "aws_s3_bucket" "bucket_east_2" {
  provider = aws.east_2
  bucket   = "my-bucket-us-east-2-xyz"
}

# Created in us-west-1
resource "aws_s3_bucket" "bucket_west_1" {
  provider = aws.west_1
  bucket   = "my-bucket-us-west-1-xyz"
}

```


[1] https://oneuptime.com/blog/post/2026-02-12-manage-multiple-aws-regions-terraform/view
[2] https://aws.amazon.com/blogs/devops/multi-region-terraform-deployments-with-aws-codepipeline-using-terraform-built-ci-cd/
[3] https://www.youtube.com/watch?v=y-nrZG5omwQ&vl=en-IN
[4] https://oneuptime.com/blog/post/2026-02-12-manage-multiple-aws-regions-terraform/view
[5] https://controlmonkey.io/resource/terraform-variables-guide/
[6] https://discuss.hashicorp.com/t/how-to-dynamically-pass-region-to-providers-within-module/54294
[7] https://stackoverflow.com/questions/70999249/multi-region-deployment-using-terraform-providers

