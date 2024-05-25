[Andrew Brown-u/omenking](https://www.reddit.com/user/omenking/) -  
[I passed the HashiCorp Terraform Certification with a 84%. Here's my Guide](https://www.reddit.com/r/Terraform/comments/pcrvk6/i_passed_the_hashicorp_terraform_certification/)

<hr>
[GitHub Provider](https://registry.terraform.io/providers/integrations/github/latest/docs)

[Resource: aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)
Providers/hashicorp/aws/V5.46.0/Latest Version  

[Resource: aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)  

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

lesson 58

2 different types of Data Source: aws_instance
**1st** is [Data Source: aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instance)  
**2nd** is [Data Source: aws_instances](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instances)

both have different purposes **1st** will only allow 1 resouce info to be returned example if multiple ec2 are present in aws account it will return a error and ask for filter or attribute or something  
**2nd** will come handy in multiple resource are present in aws account


(5/16/24)  
[Resource: aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group.html)

[Resource: aws_iam_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user)

[GraphiViz Documentation Referred in Course](https://graphviz.gitlab.io/download/)

(5/17/24)  
[zipmap Function](https://developer.hashicorp.com/terraform/language/functions/zipmap)  
terraform functions zipmaps  

[Developer/Terraform/Configuration Language/Meta-Arguments/](https://developer.hashicorp.com/terraform/language/meta-arguments/depends_on)  
Meta-Arguments:
- depends_on
- count
- for_each
- provider
- lifecycle


[toset Function](https://developer.hashicorp.com/terraform/language/functions/toset)  
Developer/Terraform/Configuration Language/Functions/toset
Type Conversion Functions
- can
- issensitive
- nonsensitive
- sensitive
- tobool
- tolist
- tomap
- tonumber
- toset
- tostring
- try
- type

[Command: graph](https://developer.hashicorp.com/terraform/cli/commands/graph)  
Developer/Terraform/Terraform CLI/commands/graph

Inspecting Infrastructure
- Overview
- graph
- output
- show
- state list
- state show

(5/18/24)  
[Provisioners](https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax)  
Developer/Terraform/Configuration Language/Resources/Provisioners/Declaring Provisioners  

Provisioners
- Declaring Provisioners
- Provisioner Connections
- Provisioners Without a Resource
- file
- [local-exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec)  
- [remote-exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec)
   

[null resource for provisioners](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource)

(5/20/24)  
[Terraform Registry URL](https://registry.terraform.io/)  

[registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest](https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest)

[modules_doc_for_ec2->Inputs](https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest#inputs)

[muodule_doc_for_ec2->Notes](https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest#notes)

[Single EC2 Instance -> Example Code from the Doc](https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest#single-ec2-instance)

[You can refere or check the source in the githubpage as well - might be a good practice - Source Code](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance)

check this lesson for workspaces:  
[Implementing Terraform Workspace](https://github.com/zealvora/terraform-beginner-to-advanced-resource/blob/master/Section%204%20-%20Terraform%20Modules%20%26%20Workspaces/kplabs-workspace.md)

(5/21/24)  
[registry.terraform.io/providers/hashicorp/aws/latest/docs/RDS (Relational Database) - Resource: aws_db_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance.html)

[Github](https://developer.hashicorp.com/terraform/language/modules/sources#github)

[gitignore](https://github.com/github/gitignore)

[Terraform.gitignore](https://github.com/github/gitignore/blob/main/Terraform.gitignore)

[Developer/Terraform/Configuration Language/Terraform Settings/Backends/Backend Configuration](https://developer.hashicorp.com/terraform/language/settings/backends/configuration)

[Backend/S3](https://developer.hashicorp.com/terraform/language/settings/backends/s3)

(5/22/24)  
[access Key](https://developer.hashicorp.com/terraform/language/settings/backends/s3#access_key)

[secret key](https://developer.hashicorp.com/terraform/language/settings/backends/s3#secret_key)

[DynamoDB State Locking](https://developer.hashicorp.com/terraform/language/settings/backends/s3#dynamodb-state-locking)

(5/23/24)  
[State](https://developer.hashicorp.com/terraform/language/state)  

[Developer/Terraform/Configuration Language/State/Remote State](https://developer.hashicorp.com/terraform/language/state/remote)

[The terraform_remote_state Data Source](https://developer.hashicorp.com/terraform/language/state/remote-state-data)

[Import](https://developer.hashicorp.com/terraform/language/import)

(5/24/24)
[Vault AWS Module](https://registry.terraform.io/modules/hashicorp/vault/aws/latest)

[Inject secrets into Terraform using the Vault provider](https://developer.hashicorp.com/terraform/tutorials/secrets/secrets-vault)
