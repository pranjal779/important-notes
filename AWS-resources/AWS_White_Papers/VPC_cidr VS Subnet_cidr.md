A Virtual Private Cloud (VPC) CIDR is the large pool of IP addresses for your entire network, while a subnet CIDR is a smaller, carved-out portion of that pool assigned to a specific segment.  Amazon AWS Documentation +1

Key Differences
Scope: The VPC CIDR blocks define the total boundary and maximum available IP space, whereas subnet CIDR blocks divide that space into smaller child networks.  Amazon AWS Documentation +2

Size (Netmask): A VPC typically uses a larger block like /16 (65,536 total IP addresses), while subnets use smaller blocks like /24 (256 IP addresses). YouTube·Rahul Wagh

Relationship: Subnet CIDRs must fit completely inside the parent VPC CIDR range and cannot overlap with each other. Amazon AWS Documentation

Example Breakdown
VPC CIDR: 10.0.0.0/16 (Provides 65,536 total IP addresses).
Subnet 1 CIDR: 10.0.1.0/24 (Provides 256 addresses for a public tier).
Subnet 2 CIDR: 10.0.2.0/24 (Provides 256 addresses for a private tier). 

[1] https://www.youtube.com/watch?v=KiWXRL-2TnY
[2] https://docs.aws.amazon.com/vpc/latest/userguide/subnet-sizing.html
[3] https://docs.aws.amazon.com/vpc/latest/userguide/vpc-cidr-blocks.html

[AWS Networking (VPCs, Subnets, CIDR) and Terraform Integration](https://kevonmayers31.medium.com/aws-networking-vpcs-subnets-cidr-and-terraform-integration-97faf8710746)
