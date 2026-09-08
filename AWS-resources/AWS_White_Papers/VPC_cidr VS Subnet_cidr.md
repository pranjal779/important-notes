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

---

[AWS Networking (VPCs, Subnets, CIDR) and Terraform Integration](https://kevonmayers31.medium.com/aws-networking-vpcs-subnets-cidr-and-terraform-integration-97faf8710746)

---

### Both a VPC and a subnet in AWS have their own CIDR blocks.

Think of the VPC CIDR block as the "parent" IP range, while the subnet CIDR block is a smaller "child" slice carved out from that parent range. [1, 2]  
Here is how the relationship and rules work between them: 
1. The VPC CIDR Block (The Parent) 

• Purpose: It defines the overall, total IP address pool available for your entire virtual network. 
• Sizing Rules: In AWS, an IPv4 VPC CIDR block must be between a /16 (65,536 IPs) and a /28 (16 IPs) in size. 
• Flexibility: When you create a VPC, you designate a primary CIDR block. You cannot change this primary block later, but you can associate up to four secondary CIDR blocks to expand your network if you run out of IPs. [1, 3, 4]  

2. The Subnet CIDR Block (The Child) 

• Purpose: It allocates a specific subset of the VPC's IP addresses to a particular Availability Zone (AZ) within that region. 
• Sizing Rules: A subnet's CIDR block must be a contiguous subset of the VPC's CIDR block. Like the VPC, its size can range from /16 down to /28. 
• Overlap Restrictions: Subnet CIDR blocks within the same VPC cannot overlap with each other. 
• AWS Reserved IPs: No matter what size CIDR block you assign to a subnet, AWS always reserves the first four IP addresses and the last IP address of that range for routing, DNS, and network management purposes. [2, 5]  

A Quick Visual Example 
If you build a standard setup, it usually looks like this: 

| Component | CIDR Block | Total IPv4 Addresses | Notes  |
| --- | --- | --- | --- |
| VPC (Parent Network) | 10.0.0.0/16 | 65,536 | The total boundary for the environment.  |
| Subnet A (Public) | 10.0.1.0/24 | 256 (251 usable) | A slice carved out for web servers.  |
| Subnet B (Private) | 10.0.2.0/24 | 256 (251 usable) | A non-overlapping slice for databases.  |

Are you trying to design a new network layout, or are you running into an IP overlapping issue on an existing VPC? 


[1] https://docs.aws.amazon.com/vpc/latest/userguide/vpc-cidr-blocks.html
[2] https://docs.aws.amazon.com/vpc/latest/userguide/subnet-sizing.html
[3] https://www.youtube.com/watch?v=9awnj9lafTA
[4] https://aws.amazon.com/vpc/faqs/
[5] https://docs.aws.amazon.com/vpc/latest/userguide/default-vpc-components.html
[6] https://docs.aws.amazon.com/vpc/latest/userguide/vpc-subnet-basics.html

---


[Query for the latest Amazon Linux AMI IDs using AWS Systems Manager Parameter Store](https://aws.amazon.com/blogs/compute/query-for-the-latest-amazon-linux-ami-ids-using-aws-systems-manager-parameter-store/)
[VPC CIDR blocks - Amazon Virtual Private Cloud](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-cidr-blocks.html)

[Subnet CIDR blocks](https://docs.aws.amazon.com/vpc/latest/userguide/subnet-sizing.html)
