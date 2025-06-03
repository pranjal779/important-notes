A company has its application servers in the public subnet that connect to the Amazon RDS instances in the private subnet. For regular maintenance, the Amazon RDS instances need patch fixes that need to be downloaded from the internet.

Considering the company uses only IPv4 addressing and is looking for a fully managed service, which of the following would you suggest as an optimal solution?

Configure a Network Address Translation instance (NAT instance) in the public subnet of the VPC

Your answer is incorrect
Configure the Internet Gateway of the VPC to be accessible to the private subnet resources by changing the route tables

Configure an Egress-only internet gateway for the resources in the private subnet of the VPC

Correct answer
Configure a Network Address Translation gateway (NAT gateway) in the public subnet of the VPC

Overall explanation
Correct option:

Configure a Network Address Translation gateway (NAT gateway) in the public subnet of the VPC

You can use a Network Address Translation gateway (NAT gateway) to enable instances in a private subnet to connect to the internet or other AWS services, but prevent the internet from initiating a connection with those instances. To create a NAT gateway, you must specify the public subnet in which the NAT gateway should reside.

You must also specify an Elastic IP address to associate with the NAT gateway when you create it. The Elastic IP address cannot be changed after you associate it with the NAT Gateway. After you've created a NAT gateway, you must update the route table associated with one or more of your private subnets to point internet-bound traffic to the NAT gateway. This enables instances in your private subnets to communicate with the internet. If you no longer need a NAT gateway, you can delete it. Deleting a NAT gateway disassociates its Elastic IP address, but does not release the address from your account.

VPC architecture with NAT:  via - https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html

Incorrect options:

Configure an Egress-only internet gateway for the resources in the private subnet of the VPC - An Egress-only internet gateway is an Internet Gateway that supports IPv6 traffic, so this option is not correct for the given use-case.

Configure a Network Address Translation instance (NAT instance) in the public subnet of the VPC - You can use a network address translation (NAT) instance in a public subnet in your VPC to enable instances in the private subnet to initiate outbound IPv4 traffic to the internet or other AWS services, but prevent the instances from receiving inbound traffic initiated by someone on the internet. NAT instances are not a managed service, it has to be managed and maintained by the customer.

Configure the Internet Gateway of the VPC to be accessible to the private subnet resources by changing the route tables - Internet Gateway cannot be used directly with a private subnet. It is not possible to set up this configuration, without a NAT instance or a NAT gateway in the public subnet.

References:

https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html

https://docs.aws.amazon.com/vpc/latest/userguide/VPC_NAT_Instance.html

https://docs.aws.amazon.com/vpc/latest/userguide/egress-only-internet-gateway.html

Domain
Design Secure Architectures

---------------------------------

A media company wants a low-latency way to distribute live sports results which are delivered via a proprietary application using UDP protocol.

As a solutions architect, which of the following solutions would you recommend such that it offers the BEST performance for this use case?

Use Amazon CloudFront to provide a low latency way to distribute live sports results

Your answer is correct
Use AWS Global Accelerator to provide a low latency way to distribute live sports results

Use Auto Scaling group to provide a low latency way to distribute live sports results

Use Elastic Load Balancing (ELB) to provide a low latency way to distribute live sports results

Overall explanation
Correct option:

Use AWS Global Accelerator to provide a low latency way to distribute live sports results

AWS Global Accelerator is a networking service that helps you improve the availability and performance of the applications that you offer to your global users. AWS Global Accelerator is easy to set up, configure, and manage. It provides static IP addresses that provide a fixed entry point to your applications and eliminate the complexity of managing specific IP addresses for different AWS Regions and Availability Zones (AZs). AWS Global Accelerator always routes user traffic to the optimal endpoint based on performance, reacting instantly to changes in application health, your user’s location, and policies that you configure. Global Accelerator is a good fit for non-HTTP use cases, such as gaming (UDP), IoT (MQTT), or Voice over IP. Therefore, this option is correct.

How AWS Global Accelerator Works:  via - https://aws.amazon.com/global-accelerator/

Incorrect options:

Use Amazon CloudFront to provide a low latency way to distribute live sports results - Amazon CloudFront is a fast content delivery network (CDN) service that securely delivers data, videos, applications, and APIs to customers globally with low latency, high transfer speeds, all within a developer-friendly environment.

Amazon CloudFront points of presence (POPs) (edge locations) make sure that popular content can be served quickly to your viewers. Amazon CloudFront also has regional edge caches that bring more of your content closer to your viewers, even when the content is not popular enough to stay at a POP, to help improve performance for that content. Regional edge caches help with all types of content, particularly content that tends to become less popular over time. Examples include user-generated content, such as video, photos, or artwork; e-commerce assets such as product photos and videos; and news and event-related content that might suddenly find new popularity. CloudFront supports HTTP/RTMP protocol based requests, therefore this option is incorrect.

Use Elastic Load Balancing (ELB) to provide a low latency way to distribute live sports results - Elastic Load Balancing (ELB) automatically distributes incoming application traffic across multiple targets, such as Amazon EC2 instances, containers, IP addresses, and AWS Lambda functions. It can handle the varying load of your application traffic in a single Availability Zone or across multiple Availability Zones. Elastic Load Balancer cannot help with decreasing latency of incoming traffic from the source.

Use Auto Scaling group to provide a low latency way to distribute live sports results - Amazon EC2 Auto Scaling helps you ensure that you have the correct number of Amazon EC2 instances available to handle the load for your application. You create collections of Amazon EC2 instances, called Auto Scaling groups. You can specify the minimum number of instances in each Auto Scaling group, and Amazon EC2 Auto Scaling ensures that your group never goes below this size. Auto Scaling group cannot help with decreasing latency of incoming traffic from the source.

Exam Alert:

Please note the differences between the capabilities of AWS Global Accelerator and Amazon CloudFront -

AWS Global Accelerator and Amazon CloudFront are separate services that use the AWS global network and its edge locations around the world. Amazon CloudFront improves performance for both cacheable content (such as images and videos) and dynamic content (such as API acceleration and dynamic site delivery). AWS Global Accelerator improves performance for a wide range of applications over TCP or UDP by proxying packets at the edge to applications running in one or more AWS Regions.

AWS Global Accelerator is a good fit for non-HTTP use cases, such as gaming (UDP), IoT (MQTT), or Voice over IP, as well as for HTTP use cases that specifically require static IP addresses or deterministic, fast regional failover. Both services integrate with AWS Shield for DDoS protection.

References:

https://aws.amazon.com/global-accelerator/

https://aws.amazon.com/cloudfront/faqs/

Domain
Design High-Performing Architectures

---------------------

The DevOps team at a multi-national company is helping its subsidiaries standardize Amazon EC2 instances by using the same Amazon Machine Image (AMI). Some of these subsidiaries are in the same AWS region but use different AWS accounts whereas others are in different AWS regions but use the same AWS account as the parent company. The DevOps team has hired you as a solutions architect for this project.

Which of the following would you identify as CORRECT regarding the capabilities of an Amazon Machine Image (AMI)? (Select three)

Copying an Amazon Machine Image (AMI) backed by an encrypted snapshot results in an unencrypted target snapshot

Your selection is correct
Copying an Amazon Machine Image (AMI) backed by an encrypted snapshot cannot result in an unencrypted target snapshot

You cannot copy an Amazon Machine Image (AMI) across AWS Regions

Your selection is correct
You can share an Amazon Machine Image (AMI) with another AWS account

You cannot share an Amazon Machine Image (AMI) with another AWS account

Your selection is correct
You can copy an Amazon Machine Image (AMI) across AWS Regions

Overall explanation
Correct options:

You can copy an Amazon Machine Image (AMI) across AWS Regions

You can share an Amazon Machine Image (AMI) with another AWS account

Copying an Amazon Machine Image (AMI) backed by an encrypted snapshot cannot result in an unencrypted target snapshot

An Amazon Machine Image (AMI) provides the information required to launch an instance. An AMI includes the following:

One or more Amazon EBS snapshots, or, for instance-store-backed AMIs, a template for the root volume of the instance.

Launch permissions that control which AWS accounts can use the AMI to launch instances.

A block device mapping that specifies the volumes to attach to the instance when it's launched.

You can copy an AMI within or across AWS Regions using the AWS Management Console, the AWS Command Line Interface or SDKs, or the Amazon EC2 API, all of which support the CopyImage action. You can copy both Amazon EBS-backed AMIs and instance-store-backed AMIs. You can copy AMIs with encrypted snapshots and also change encryption status during the copy process. Therefore, the option - "You can copy an AMI across AWS Regions" - is correct.

Copying AMIs across regions:  via - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/CopyingAMIs.html
![image](https://github.com/user-attachments/assets/b0a99d64-c51a-484b-b346-25167b19e560)


The following table shows encryption support for various AMI-copying scenarios. While it is possible to copy an unencrypted snapshot to yield an encrypted snapshot, you cannot copy an encrypted snapshot to yield an unencrypted one. Therefore, the option - "Copying an AMI backed by an encrypted snapshot cannot result in an unencrypted target snapshot" is correct.

 via - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/CopyingAMIs.html
 ![image](https://github.com/user-attachments/assets/cfd50bf7-6117-4fc8-a002-4ceb46f4ec4b)


You can share an AMI with another AWS account. To copy an AMI that was shared with you from another account, the owner of the source AMI must grant you read permissions for the storage that backs the AMI, either the associated Amazon EBS snapshot (for an Amazon EBS-backed AMI) or an associated S3 bucket (for an instance store-backed AMI). Therefore, the option - "You can share an AMI with another AWS account" - is correct.

Incorrect options:

You cannot copy an Amazon Machine Image (AMI) across AWS Regions

You cannot share an Amazon Machine Image (AMI) with another AWS account

Copying an Amazon Machine Image (AMI) backed by an encrypted snapshot results in an unencrypted target snapshot

These three options contradict the details provided in the explanation above.

Reference:

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/CopyingAMIs.html

Domain
Design Secure Architectures

---------------------------------

A company wants to improve its gaming application by adding a leaderboard that uses a complex proprietary algorithm based on the participating user's performance metrics to identify the top users on a real-time basis. The technical requirements mandate high elasticity, low latency, and real-time processing to deliver customizable user data for the community of users. The leaderboard would be accessed by millions of users simultaneously.

Which of the following options support the case for using Amazon ElastiCache to meet the given requirements? (Select two)

Your selection is correct
Use Amazon ElastiCache to improve latency and throughput for read-heavy application workloads

Correct selection
Use Amazon ElastiCache to improve the performance of compute-intensive workloads

Use Amazon ElastiCache to run highly complex JOIN queries

Use Amazon ElastiCache to improve latency and throughput for write-heavy application workloads

Your selection is incorrect
Use Amazon ElastiCache to improve the performance of Extract-Transform-Load (ETL) workloads

Overall explanation
Correct option:

Use Amazon ElastiCache to improve latency and throughput for read-heavy application workloads

Use Amazon ElastiCache to improve the performance of compute-intensive workloads

Amazon ElastiCache allows you to run in-memory data stores in the AWS cloud. Amazon ElastiCache is a popular choice for real-time use cases like Caching, Session Stores, Gaming, Geospatial Services, Real-Time Analytics, and Queuing.

 via - https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/elasticache-use-cases.html 
 ![image](https://github.com/user-attachments/assets/29b1b3cb-8141-457c-a8cf-ba13ddc60af8)


Amazon ElastiCache can be used to significantly improve latency and throughput for many read-heavy application workloads (such as social networking, gaming, media sharing, leaderboard, and Q&A portals) or compute-intensive workloads (such as a recommendation engine) by allowing you to store the objects that are often read in the cache.

Overview of Amazon ElastiCache features:  via - https://aws.amazon.com/elasticache/features/
![image](https://github.com/user-attachments/assets/74ce9c3c-44c6-42dd-81dd-1ce6950c3ef9)


Incorrect options:

Use Amazon ElastiCache to improve latency and throughput for write-heavy application workloads - As mentioned earlier in the explanation, Amazon ElastiCache can be used to significantly improve latency and throughput for many read-heavy application workloads. Caching is not a good fit for write-heavy applications as the cache goes stale at a very fast rate.

Use Amazon ElastiCache to improve the performance of Extract-Transform-Load (ETL) workloads - ETL workloads involve reading and transforming high-volume data which is not a good fit for caching. You should use AWS Glue or Amazon EMR to facilitate ETL workloads.

Use Amazon ElastiCache to run highly complex JOIN queries - Complex JSON queries can be run on relational databases such as Amazon RDS or Amazon Aurora. Amazon ElastiCache is not a good fit for this use case.

References:

https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/elasticache-use-cases.html

https://aws.amazon.com/elasticache/features/

Domain
Design High-Performing Architectures

----------------------

A national logistics company has a dedicated AWS Direct Connect connection from its corporate data center to AWS. Within its AWS account, the company operates 25 Amazon VPCs in the same Region, each supporting different regional distribution services. The VPCs were configured with non-overlapping CIDR blocks and currently use private VIFs for Direct Connect access to on-premises resources. As the architecture scales, the company wants to enable communication across all VPCs and the on-premises environment. The solution must scale efficiently, support full-mesh connectivity, and reduce the complexity of maintaining separate private VIFs for each VPC.

Which combination of solutions will best fulfill these requirements with the least amount of operational overhead? (Select two)

Create individual Site-to-Site VPN connections from the data center to each VPC. Set up BGP route propagation for every tunnel to facilitate on-premises-to-VPC routing

Convert each existing private VIF into a new Direct Connect gateway association by attaching a virtual private gateway (VGW) to each VPC. Manually configure routing between VGWs

Your selection is correct
Create a transit virtual interface (VIF) from the Direct Connect connection and associate it with the transit gateway

Your selection is correct
Create an AWS Transit Gateway and attach all 25 VPCs to it. Enable route propagation for each attachment to automatically manage inter-VPC routing

Reconfigure each VPC to connect through AWS PrivateLink endpoints to a central networking service VPC. Share the service with other VPCs using VPC endpoint services

Overall explanation
Correct options:

Create an AWS Transit Gateway and attach all 25 VPCs to it. Enable route propagation for each attachment to automatically manage inter-VPC routing

Attaching all VPCs to a single AWS Transit Gateway centralizes routing and allows for transitive communication between the VPCs. Enabling route propagation eliminates the need to manually update route tables for every VPC. This design supports scalable, full-mesh VPC connectivity with low operational burden.

![image](https://github.com/user-attachments/assets/e52aa49e-47d4-432a-9270-80523175a947)


 via - https://docs.aws.amazon.com/whitepapers/latest/hybrid-connectivity/aws-dx-dxgw-with-vgw-multi-regions-and-aws-public-peering.html

Create a transit virtual interface (VIF) from the Direct Connect connection and associate it with the transit gateway

Using a transit VIF from the Direct Connect connection to the transit gateway enables on-premises-to-VPC connectivity through a single, centralized path. This eliminates the need to maintain multiple private VIFs and simplifies BGP management and route aggregation. Combined with Option A, this forms a highly efficient hub-and-spoke architecture.

Incorrect options:

Create individual Site-to-Site VPN connections from the data center to each VPC. Set up BGP route propagation for every tunnel to facilitate on-premises-to-VPC routing - Creating 25 individual VPN connections adds significant operational complexity, introduces higher latency, and does not make use of the existing high-throughput Direct Connect connection. While VPNs can provide connectivity, they are inferior in performance and scalability for this use case.

Reconfigure each VPC to connect through AWS PrivateLink endpoints to a central networking service VPC. Share the service with other VPCs using VPC endpoint services - AWS PrivateLink is used to expose services privately, not to enable full VPC-to-VPC or on-premises routing. It supports one-way access to a specific service, and cannot be used to facilitate general network-level communication between all VPCs and the data center.

Convert each existing private VIF into a new Direct Connect gateway association by attaching a virtual private gateway (VGW) to each VPC. Manually configure routing between VGWs - While a Direct Connect gateway allows centralized on-premises access, it does not support transitive routing between VPCs. You would also need to deploy and manage 25 separate virtual private gateways (VGWs), which increases complexity and operational burden. Inter-VPC communication would still require peering or another layer of routing.

References:

https://aws.amazon.com/transit-gateway/

https://docs.aws.amazon.com/directconnect/latest/UserGuide/WorkingWithVirtualInterfaces.html

https://docs.aws.amazon.com/directconnect/latest/UserGuide/Welcome.html

https://docs.aws.amazon.com/whitepapers/latest/hybrid-connectivity/aws-dx-dxgw-with-vgw-multi-regions-and-aws-public-peering.html

Domain
Design Secure Architectures

---------------

A healthcare startup is modernizing its monolithic Python-based analytics application by transitioning to a microservices architecture on AWS. As a pilot, the team wants to refactor one module into a standalone microservice that can handle hundreds of requests per second. They are seeking an AWS-native solution that supports Python, scales automatically with traffic, and requires minimal infrastructure management and operational overhead to build, test, and deploy the service efficiently.

Which AWS solution best meets these requirements?

Your answer is incorrect
Deploy the microservice in an AWS Fargate task using Amazon ECS. Package the code in a Docker container image with a Python runtime and configure ECS Service Auto Scaling to respond to CPU utilization metrics

Use Amazon EC2 Spot Instances in an Auto Scaling group. Launch the Python application as a background service and install all required dependencies at instance startup

Correct answer
Use AWS Lambda to run the Python-based microservice. Integrate it with Amazon API Gateway for HTTP access and enable provisioned concurrency for performance during peak loads

Use AWS App Runner to build and deploy the Python application directly from a GitHub repository. Allow App Runner to manage traffic scaling and deployments

Overall explanation
Correct option:

Use AWS Lambda to run the Python-based microservice. Integrate it with Amazon API Gateway for HTTP access and enable provisioned concurrency for performance during peak loads

AWS Lambda is a fully managed serverless compute service that natively supports Python runtimes. It is ideal for event-driven and API-based microservices. Lambda automatically scales based on request volume, requires no server provisioning or patching, and integrates easily with API Gateway for RESTful access. The company can also enable provisioned concurrency to reduce cold start latency for high-throughput workloads. This approach aligns perfectly with the requirement for minimal infrastructure and high scalability.

 via - https://aws.amazon.com/blogs/compute/creating-low-latency-high-volume-apis-with-provisioned-concurrency/
 ![image](https://github.com/user-attachments/assets/a4a71225-a92e-4215-b8b8-b63a91c0bf02)


 via - https://aws.amazon.com/blogs/compute/creating-low-latency-high-volume-apis-with-provisioned-concurrency/
 ![image](https://github.com/user-attachments/assets/5054f8f9-66dd-4aca-9a61-2540290ff1ef)


Incorrect options:

Deploy the microservice in an AWS Fargate task using Amazon ECS. Package the code in a Docker container image with a Python runtime and configure ECS Service Auto Scaling to respond to CPU utilization metrics - AWS Fargate is a serverless container service that works with ECS and supports auto scaling, but it requires containerization of the application, Dockerfile management, and more setup complexity than Lambda. Although suitable for microservices, it involves more operational overhead, especially during initial development and testing phases.

Use AWS App Runner to build and deploy the Python application directly from a GitHub repository. Allow App Runner to manage traffic scaling and deployments - AWS App Runner provides simple deployment from source code or container images and supports Python apps via containerized runtimes. However, App Runner is more suitable for long-running web applications rather than event-driven functions. It also incurs costs during idle time and requires setting up build and deployment configurations, which may not be ideal for rapid experimentation.

Use Amazon EC2 Spot Instances in an Auto Scaling group. Launch the Python application as a background service and install all required dependencies at instance startup - While Spot Instances are cost-effective, they are not reliable for production workloads due to the risk of interruption. Additionally, managing EC2 Auto Scaling groups and instance health checks introduces high operational overhead, which contradicts the goal of minimal infrastructure and low maintenance.

References:

https://docs.aws.amazon.com/lambda/latest/dg/services-apigateway.html

https://aws.amazon.com/blogs/compute/creating-low-latency-high-volume-apis-with-provisioned-concurrency/

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html

https://docs.aws.amazon.com/apprunner/latest/dg/what-is-apprunner.html

https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS_Fargate.html

Domain
Design High-Performing Architectures

----------------

An e-commerce company uses Microsoft Active Directory to provide users and groups with access to resources on the on-premises infrastructure. The company has extended its IT infrastructure to AWS in the form of a hybrid cloud. The engineering team at the company wants to run directory-aware workloads on AWS for a SQL Server-based application. The team also wants to configure a trust relationship to enable single sign-on (SSO) for its users to access resources in either domain.

As a solutions architect, which of the following AWS services would you recommend for this use-case?

Your answer is correct
AWS Directory Service for Microsoft Active Directory (AWS Managed Microsoft AD)

Simple Active Directory (Simple AD)

Active Directory Connector

Amazon Cloud Directory

Overall explanation
Correct option:

AWS Directory Service for Microsoft Active Directory (AWS Managed Microsoft AD)

AWS Directory Service provides multiple ways to use Amazon Cloud Directory and Microsoft Active Directory (AD) with other AWS services.

AWS Directory Service for Microsoft Active Directory (aka AWS Managed Microsoft AD) is powered by an actual Microsoft Windows Server Active Directory (AD), managed by AWS. With AWS Managed Microsoft AD, you can run directory-aware workloads in the AWS Cloud such as SQL Server-based applications. You can also configure a trust relationship between AWS Managed Microsoft AD in the AWS Cloud and your existing on-premises Microsoft Active Directory, providing users and groups with access to resources in either domain, using single sign-on (SSO).

Incorrect options:

Active Directory Connector - Use AD Connector if you only need to allow your on-premises users to log in to AWS applications and services with their Active Directory credentials. AD Connector simply connects your existing on-premises Active Directory to AWS. You cannot use it to run directory-aware workloads on AWS, hence this option is not correct.

Simple Active Directory (Simple AD) - Simple AD provides a subset of the features offered by AWS Managed Microsoft AD. Simple AD is a standalone managed directory that is powered by a Samba 4 Active Directory Compatible Server. Simple AD does not support features such as trust relationships with other domains. Therefore, this option is not correct.

Amazon Cloud Directory - Amazon Cloud Directory is a cloud-native directory that can store hundreds of millions of application-specific objects with multiple relationships and schemas. Use Amazon Cloud Directory if you need a highly scalable directory store for your application’s hierarchical data. You cannot use it to establish trust relationships with other domains on the on-premises infrastructure. Therefore, this option is not correct.

Exam Alert:

You may see questions on choosing "AWS Managed Microsoft AD" vs "AD Connector" vs "Simple AD" on the exam. Just remember that you should use AD Connector if you only need to allow your on-premises users to log in to AWS applications with their Active Directory credentials. AWS Managed Microsoft AD would also allow you to run directory-aware workloads in the AWS Cloud. AWS Managed Microsoft AD is your best choice if you have more than 5,000 users and need a trust relationship set up between an AWS hosted directory and your on-premises directories. Simple AD is the least expensive option and your best choice if you have 5,000 or fewer users and don’t need the more advanced Microsoft Active Directory features such as trust relationships with other domains.

Reference:

https://docs.aws.amazon.com/directoryservice/latest/admin-guide/what_is.html

Domain
Design High-Performing Architectures


----------------------

The DevOps team at an IT company is provisioning a two-tier application in a VPC with a public subnet and a private subnet. The team wants to use either a Network Address Translation (NAT) instance or a Network Address Translation (NAT) gateway in the public subnet to enable instances in the private subnet to initiate outbound IPv4 traffic to the internet but needs some technical assistance in terms of the configuration options available for the Network Address Translation (NAT) instance and the Network Address Translation (NAT) gateway.

As a solutions architect, which of the following options would you identify as CORRECT? (Select three)

Your selection is incorrect
NAT gateway supports port forwarding

Your selection is incorrect
Security Groups can be associated with a NAT gateway

NAT gateway can be used as a bastion server

Correct selection
Security Groups can be associated with a NAT instance

Your selection is correct
NAT instance can be used as a bastion server

Correct selection
NAT instance supports port forwarding

Overall explanation
Correct options:

NAT instance can be used as a bastion server

Security Groups can be associated with a NAT instance

NAT instance supports port forwarding

A NAT instance or a NAT Gateway can be used in a public subnet in your VPC to enable instances in the private subnet to initiate outbound IPv4 traffic to the Internet.

How NAT Gateway works:  via - https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html

How NAT Instance works:  via - https://docs.aws.amazon.com/vpc/latest/userguide/VPC_NAT_Instance.html

Please see this high-level summary of the differences between NAT instances and NAT gateways relevant to the options described in the question:

 via - https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-comparison.html

Incorrect options:

NAT gateway supports port forwarding

Security Groups can be associated with a NAT gateway

NAT gateway can be used as a bastion server

These three options contradict the details provided in the explanation above, so these options are incorrect.

Reference:

https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-comparison.html

Domain
Design High-Performing Architectures

---------------

A retail company has connected its on-premises data center to the AWS Cloud via AWS Direct Connect. The company wants to be able to resolve Domain Name System (DNS) queries for any resources in the on-premises network from the AWS VPC and also resolve any DNS queries for resources in the AWS VPC from the on-premises network.

As a solutions architect, which of the following solutions can be combined to address the given use case? (Select two)

Your selection is incorrect
Create an inbound endpoint on Amazon Route 53 Resolver and then Amazon Route 53 Resolver can conditionally forward queries to resolvers on the on-premises network via this endpoint

Create a universal endpoint on Amazon Route 53 Resolver and then Amazon Route 53 Resolver can receive and forward queries to resolvers on the on-premises network via this endpoint

Create an outbound endpoint on Amazon Route 53 Resolver and then DNS resolvers on the on-premises network can forward DNS queries to Amazon Route 53 Resolver via this endpoint

Correct selection
Create an inbound endpoint on Amazon Route 53 Resolver and then DNS resolvers on the on-premises network can forward DNS queries to Amazon Route 53 Resolver via this endpoint

Your selection is correct
Create an outbound endpoint on Amazon Route 53 Resolver and then Amazon Route 53 Resolver can conditionally forward queries to resolvers on the on-premises network via this endpoint

Overall explanation
Correct options:

Create an inbound endpoint on Amazon Route 53 Resolver and then DNS resolvers on the on-premises network can forward DNS queries to Amazon Route 53 Resolver via this endpoint

Create an outbound endpoint on Amazon Route 53 Resolver and then Amazon Route 53 Resolver can conditionally forward queries to resolvers on the on-premises network via this endpoint

Amazon Route 53 is a highly available and scalable cloud Domain Name System (DNS) web service. Amazon Route 53 effectively connects user requests to infrastructure running in AWS – such as Amazon EC2 instances – and can also be used to route users to infrastructure outside of AWS. By default, Amazon Route 53 Resolver automatically answers DNS queries for local VPC domain names for Amazon EC2 instances. You can integrate DNS resolution between Resolver and DNS resolvers on your on-premises network by configuring forwarding rules.

To resolve any DNS queries for resources in the AWS VPC from the on-premises network, you can create an inbound endpoint on Amazon Route 53 Resolver and then DNS resolvers on the on-premises network can forward DNS queries to Amazon Route 53 Resolver via this endpoint.

Resolver Inbound Endpoint:  via - https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resolver.html

![image](https://github.com/user-attachments/assets/93ee7e80-0753-4c79-a5d2-407a30cff51a)


To resolve DNS queries for any resources in the on-premises network from the AWS VPC, you can create an outbound endpoint on Amazon Route 53 Resolver and then Amazon Route 53 Resolver can conditionally forward queries to resolvers on the on-premises network via this endpoint. To conditionally forward queries, you need to create Resolver rules that specify the domain names for the DNS queries that you want to forward (such as example.com) and the IP addresses of the DNS resolvers on the on-premises network that you want to forward the queries to.

Resolver Outbound Endpoint:  via - https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resolver.html

![image](https://github.com/user-attachments/assets/004952fc-cd7c-4fe4-9159-5a2262d95ca9)


Incorrect options:

Create an outbound endpoint on Amazon Route 53 Resolver and then DNS resolvers on the on-premises network can forward DNS queries to Amazon Route 53 Resolver via this endpoint - DNS resolvers on the on-premises network can forward DNS queries to Amazon Route 53 Resolver via an inbound endpoint. Hence, this option is incorrect.

Create an inbound endpoint on Amazon Route 53 Resolver and then Amazon Route 53 Resolver can conditionally forward queries to resolvers on the on-premises network via this endpoint - Amazon Route 53 Resolver can conditionally forward queries to resolvers on the on-premises network via an outbound endpoint. Hence, this option is incorrect.

Create a universal endpoint on Amazon Route 53 Resolver and then Amazon Route 53 Resolver can receive and forward queries to resolvers on the on-premises network via this endpoint - There is no such thing as a universal endpoint on Amazon Route 53 Resolver. This option has been added as a distractor.

References:

https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resolver-getting-started.html

https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resolver.html

Domain
Design Secure Architectures

----------------

A software company manages a fleet of Amazon EC2 instances that support internal analytics applications. These instances use an IAM role with custom policies to connect to Amazon RDS and AWS Secrets Manager for secure access to credentials and database endpoints. The IT operations team wants to implement a centralized patch management solution that simplifies compliance and security tasks. Their goal is to automate OS patching across EC2 instances without disrupting the running applications.

Which approach will allow the company to meet these goals with the least administrative overhead?

Manually install the Systems Manager Agent (SSM Agent) on each EC2 instance. Schedule daily patch jobs using cron scripts

Create a second IAM role with the AmazonSSMManagedInstanceCore policy and attach both the new and the existing IAM roles to each EC2 instance using Systems Manager Hybrid Activation

Correct answer
Enable Default Host Management Configuration in AWS Systems Manager Quick Setup

Your answer is incorrect
Detach the existing IAM role from all EC2 instances. Replace it with a new role that has both the original permissions and the AmazonSSMManagedInstanceCore policy to enable Systems Manager features

Overall explanation
Correct option:

Enable Default Host Management Configuration in AWS Systems Manager Quick Setup

This is the simplest and most reliable solution that aligns with the company's requirement for zero disruption and minimal administrative effort. AWS Systems Manager’s Default Host Management Configuration (part of Quick Setup) automatically applies the necessary Systems Manager permissions, activates inventory collection, and enables patching without needing to alter existing IAM roles manually. It simplifies onboarding by using AWS best practices and auto-configures EC2 instances with the required SSM settings behind the scenes.

 via - https://aws.amazon.com/blogs/mt/enable-management-of-your-amazon-ec2-instances-in-aws-systems-manager-using-default-host-management-configuration/

![image](https://github.com/user-attachments/assets/aba20af2-8586-447d-a77e-defe539174ee)


Incorrect options:

Create a second IAM role with the AmazonSSMManagedInstanceCore policy and attach both the new and the existing IAM roles to each EC2 instance using Systems Manager Hybrid Activation - Hybrid Activations are designed for non-EC2 resources or on-premises servers, not for managing standard EC2 instances within an AWS account. EC2 instances can only be attached to one IAM role at a time, making the dual-role approach unfeasible. This method adds unnecessary complexity and does not align with standard AWS EC2 management practices.

Manually install the Systems Manager Agent (SSM Agent) on each EC2 instance. Schedule daily patch jobs using cron scripts - Manually scripting patching operations using cron jobs introduces high operational overhead and does not leverage native AWS integrations. This method lacks scalability, centralized compliance reporting, and the benefit of automated remediation provided by Systems Manager.

Detach the existing IAM role from all EC2 instances. Replace it with a new role that has both the original permissions and the AmazonSSMManagedInstanceCore policy to enable Systems Manager features - Detaching and replacing the existing IAM role risks disrupting application functionality that depends on the role’s current policies (e.g., RDS access). This introduces downtime and manual changes to launch templates or running instances, violating the requirement to avoid disruption.

References:

https://aws.amazon.com/blogs/mt/enable-management-of-your-amazon-ec2-instances-in-aws-systems-manager-using-default-host-management-configuration/

https://docs.aws.amazon.com/systems-manager/latest/userguide/quick-setup-host-management.html

https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2.html

Domain
Design Resilient Architectures

----------------------

The application maintenance team at a company has noticed that the production application is very slow when the business reports are run on the Amazon RDS database. These reports fetch a large amount of data and have complex queries with multiple joins, spanning across multiple business-critical core tables. CPU, memory, and storage metrics are around 50% of the total capacity.

Can you recommend an improved and cost-effective way of generating the business reports while keeping the production application unaffected?

Migrate from General Purpose SSD to magnetic storage to enhance IOPS

Correct answer
Create a read replica and connect the report generation tool/application to it

Your answer is incorrect
Configure the Amazon RDS instance to be Multi-AZ DB instance, and connect the report generation tool to the DB instance in a different AZ

Increase the size of Amazon RDS instance

Overall explanation
Correct option:

Create a read replica and connect the report generation tool/application to it

Amazon RDS Read Replicas provide enhanced performance and durability for Amazon RDS database (DB) instances. They make it easy to elastically scale out beyond the capacity constraints of a single DB instance for read-heavy database workloads. You can create one or more replicas of a given source DB Instance and serve high-volume application read traffic from multiple copies of your data, thereby increasing aggregate read throughput. Read replicas can also be promoted when needed to become standalone DB instances.

There are a variety of scenarios where deploying one or more read replicas for a given source DB instance may make sense. Common reasons for deploying a read replica include:

Scaling beyond the compute or I/O capacity of a single DB instance for read-heavy database workloads. This excess read traffic can be directed to one or more read replicas.
Serving read traffic while the source DB instance is unavailable. If your source DB Instance cannot take I/O requests (e.g. due to I/O suspension for backups or scheduled maintenance), you can direct read traffic to your read replica(s). For this use case, keep in mind that the data on the read replica may be “stale” since the source DB Instance is unavailable.
Business reporting or data warehousing scenarios; you may want business reporting queries to run against a read replica, rather than your primary, production DB Instance.
You may use a read replica for disaster recovery of the source DB instance, either in the same AWS Region or in another Region.
Comparing Read Replicas with Multi-AZ and Multi-Region Amazon RDS deployments:  via - https://aws.amazon.com/rds/features/read-replicas/
![image](https://github.com/user-attachments/assets/c99a59ea-7cbc-4d32-9fcd-881cf35f4518)


Incorrect options:

Increase the size of Amazon RDS instance - This will not help as it's mentioned that the CPU, memory, and storage are running at only 50% of the total capacity.

Migrate from General Purpose SSD to magnetic storage to enhance IOPS - This is incorrect. Amazon RDS supports magnetic storage for backward compatibility only. AWS recommends that you use General Purpose SSD or Provisioned IOPS for any storage needs.

Configure the Amazon RDS instance to be Multi-AZ DB instance, and connect the report generation tool to the DB instance in a different AZ - Amazon RDS Multi-AZ deployments provide enhanced availability and durability for RDS database (DB) instances, making them a natural fit for production database workloads. When you provision a Multi-AZ DB Instance, Amazon RDS automatically creates a primary DB Instance and synchronously replicates the data to a standby instance in a different Availability Zone (AZ). Each AZ runs on its own physically distinct, independent infrastructure, and is engineered to be highly reliable. However, you cannot read from the standby database, making multi-AZ, an incorrect option for the given scenario.

Reference:

https://aws.amazon.com/rds/features/read-replicas/

Domain
Design High-Performing Architectures
