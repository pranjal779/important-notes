[Andrew Brown-u/omenking](https://www.reddit.com/user/omenking/) -  
[I passed the HashiCorp Terraform Certification with a 84%. Here's my Guide](https://www.reddit.com/r/Terraform/comments/pcrvk6/i_passed_the_hashicorp_terraform_certification/)

[Study guide - Terraform Associate certification](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-study-003)

[Exam review - Terraform Associate certification](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003)  

[HashiCorp Terraform Associate (003) | Real Exam Questions & Answers -2023 | 100% Pass | Free PDF](https://www.youtube.com/watch?v=-RXtOzs1Gog&t=189s&ab_channel=CertyIQ)

[Terraform Language Documentation](https://developer.hashicorp.com/terraform/language/v1.1.x)
<hr>

[GitHub Provider](https://registry.terraform.io/providers/integrations/github/latest/docs)

[Resource: aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)
Providers/hashicorp/aws/V5.46.0/Latest Version  

[Resource: aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)  

[Resource: aws_security_group_rule/V5.39.1/](https://registry.terraform.io/providers/hashicorp/aws/5.39.1/docs/resources/security_group_rule.html)

[Data Source: aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group)

[AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

-----------------
(5-27-24)  
Few <ins>aws</ins> modules dump for reference:
[ec2-instance](https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest)

[iam](https://registry.terraform.io/modules/terraform-aws-modules/iam/aws/latest)  

[vpc](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)

[eks](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest)

-----------------

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

(5/29/24)
[Workspaces](https://developer.hashicorp.com/terraform/language/state/workspaces#using-workspaces)

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

(5/29/24)
[Command: import](https://developer.hashicorp.com/terraform/cli/commands/import)

(5/24/24)  
[Vault AWS Module](https://registry.terraform.io/modules/hashicorp/vault/aws/latest)

[Inject secrets into Terraform using the Vault provider](https://developer.hashicorp.com/terraform/tutorials/secrets/secrets-vault)

[Vault Provider](https://registry.terraform.io/providers/hashicorp/vault/latest/docs)

(5/25/24)  
[hashi corp Terraform cloud](https://www.hashicorp.com/cloud)

[time_sleep (Resource)](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep)  

[AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

[Terraform Cloud Account SignIn Page](https://app.terraform.io/session)

[HCP Terraform's built-in cloud integration - HCP Terraform Settings](https://developer.hashicorp.com/terraform/cli/cloud/settings)
[Terraform Offerings](https://www.hashicorp.com/products/terraform/offerings)

[Defining Sentinel Policies](https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement/sentinel)

[remote](https://developer.hashicorp.com/terraform/language/settings/backends/remote)

## Major Section - Terraform Challenges
[terraform-challenges Repo](https://github.com/zealvora/kplabs-terraform-challenges.git)


[Terraform Versions | HashiCorp Releases - older terraform version](https://releases.hashicorp.com/terraform/)

(5/26/24)  
[The for_each Meta-Argument - Configuration Language](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each)

[length Function](https://developer.hashicorp.com/terraform/language/functions/length)

[Data Source: aws_caller_identity - W3Schools](https://docs.w3cub.com/terraform/providers/aws/d/caller_identity.html)

[Data Source: aws_caller_identity - Official terraform Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)

(5/28/24)  
[Dynamic Block](https://www.terraform.io/language/expressions/dynamic-blocks)  
Dynamic blocks allow you to generate a collection of resources based on a list of values. This is useful for creating repetitive resources, such as security group rules. 

(5/29/24)
[Command: state mv](https://developer.hashicorp.com/terraform/cli/commands/state/mv)

(5/30/24)  
[HCP Terraform API Documentation](https://developer.hashicorp.com/terraform/cloud-docs/api-docs#authentication)
