[GitHub Provider](https://registry.terraform.io/providers/integrations/github/latest/docs)

[Resource: aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)
Providers/hashicorp/aws/V5.46.0/Latest Version

[Resource: aws_security_group_rule/V5.39.1/](https://registry.terraform.io/providers/hashicorp/aws/5.39.1/docs/resources/security_group_rule.html)

[Data Source: aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group)

[AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

[Resource: aws_vpc_security_group_ingress_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule.html)

[Resource: aws_vpc_security_group_egress_rule](https://registry.terraform.io/providers/-/aws/latest/docs/resources/vpc_security_group_egress_rule)


[Resource: aws_eip - "Elastic IP"](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip)

Example for Attribute for ec2: [Resource: aws_instance/Attribute Reference](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#attribute-reference)

[Resource: eip/Attribute Reference](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip)

(4/29/24)
[Resource: aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)

[Resource: aws_security_group_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule)

(4/30/24)  
[Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

(5/2/24)  
[Resource: aws_instance/Argument Reference](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#argument-reference)  
[vpc_security_group_ids](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#vpc_security_group_ids)  
vpc_security_group_ids - (Optional, VPC only) List of security group IDs to associate with.

[tags](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#tags)  
tags - (Optional) Map of tags to assign to the resource. Note that these tags apply to the instance and not block storage devices. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level.  


[Resource: aws_instance/Basic example using AMI lookup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)


(5/3/24)
[Developer/Terraform/Configuration Language/Expressions/Types and Values](https://developer.hashicorp.com/terraform/language/expressions/types#)


(5/4/24)  
[Developer/Terraform/Configuration Language/Variables and Outputs](https://developer.hashicorp.com/terraform/language/values)  
- Input Variables
- Ouput Values
- Local Values

(5/8/24)  
[Local Values](https://developer.hashicorp.com/terraform/language/values/locals)

[Declaring a Local Value](https://developer.hashicorp.com/terraform/language/values/locals#declaring-a-local-value)  

(5/9/24)  
[I passed the HashiCorp Terraform Certification with a 84%. Here's my Guide - omenking - r/Terraform - 3years ago post](https://www.reddit.com/r/Terraform/comments/pcrvk6/i_passed_the_hashicorp_terraform_certification/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)

[Built-in Functions](https://developer.hashicorp.com/terraform/language/functions)  

[lookup Function](https://developer.hashicorp.com/terraform/language/functions/lookup)  

(5/11/24)  
[lookup Function](https://developer.hashicorp.com/terraform/language/functions/lookup)  

[element Function](https://developer.hashicorp.com/terraform/language/functions/element)  

[Filesystem Functions/file Function](https://developer.hashicorp.com/terraform/language/functions/file)  

[Date and Time Function/formatdate Function](https://developer.hashicorp.com/terraform/language/functions/formatdate)

(5/14/24)  
[digitalocean_account or digitalocean/data-source/account](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/account)

[aws/resources /instace](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)

[local_file (Data Source)](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file)

(5/15/24)  
[DigitalOcean Provider](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs)  

any resource in any Provider documention will have a Resource and Data_Source - Resource will help create resources, Data_Source will help fetch info....  

[Resource: aws_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ami)  

[Data Source: aws_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)  

[Data Source: aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instance)  

2 different types of Data Source: aws_instance
**1st** is [Data Source: aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instance)  
**2nd** is [Data Source: aws_instances](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instances)

both have different purposes **1st** will only allow 1 resouce info to be returned example if multiple ec2 are present in aws account it will return a error and ask for filter or attribute or something  
**2nd** will come handy in multiple resource are present in aws account
