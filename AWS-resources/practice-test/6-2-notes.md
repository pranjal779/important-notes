The database backend for a retail company's website is hosted on Amazon RDS for MySQL having a primary instance and three read replicas to support read scalability. The company has mandated that the read replicas should lag no more than 1 second behind the primary instance to provide the best possible user experience. The read replicas are falling further behind during periods of peak traffic spikes, resulting in a bad user experience as the searches produce inconsistent results.

You have been hired as an AWS Certified Solutions Architect - Associate to reduce the replication lag as much as possible with minimal changes to the application code or the effort required to manage the underlying resources.

Which of the following will you recommend?

Your answer is incorrect
Set up an Amazon ElastiCache for Redis cluster in front of the MySQL database. Update the website to check the cache before querying the read replicas

Correct answer
Set up database migration from Amazon RDS MySQL to Amazon Aurora MySQL. Swap out the MySQL read replicas with Aurora Replicas. Configure Aurora Auto Scaling

Host the MySQL primary database on a memory-optimized Amazon EC2 instance. Spin up additional compute-optimized Amazon EC2 instances to host the read replicas

Set up database migration from Amazon RDS MySQL to Amazon DynamoDB. Provision a large number of read capacity units (RCUs) to support the required throughput and enable Auto-Scaling

Overall explanation
Correct option:

Set up database migration from Amazon RDS MySQL to Amazon Aurora MySQL. Swap out the MySQL read replicas with Aurora Replicas. Configure Aurora Auto Scaling

Aurora features a distributed, fault-tolerant, and self-healing storage system that is decoupled from compute resources and auto-scales up to 128 TiB per database instance. It delivers high performance and availability with up to 15 low-latency read replicas, point-in-time recovery, continuous backup to Amazon Simple Storage Service (Amazon S3), and replication across three Availability Zones (AZs).

Since Amazon Aurora Replicas share the same data volume as the primary instance in the same AWS Region, there is virtually no replication lag. The replica lag times are in the 10s of milliseconds (compared to the replication lag of seconds in the case of MySQL read replicas). Therefore, this is the right option to ensure that the read replicas lag no more than 1 second behind the primary instance.

Aurora Replicas:  via - https://aws.amazon.com/rds/aurora/faqs/

Incorrect options:

Host the MySQL primary database on a memory-optimized Amazon EC2 instance. Spin up additional compute-optimized Amazon EC2 instances to host the read replicas - Hosting the MySQL primary database and the read replicas on the Amazon EC2 instances would result in significant overhead to manage the underlying resources such as OS patching, database patching, etc. So this option is incorrect.

Set up an Amazon ElastiCache for Redis cluster in front of the MySQL database. Update the website to check the cache before querying the read replicas - Introducing a caching layer would result in significant changes to the application code, so this option is incorrect.

Set up database migration from Amazon RDS MySQL to Amazon DynamoDB. Provision a large number of read capacity units (RCUs) to support the required throughput and enable Auto-Scaling - Introducing a NoSQL database, such as Amazon DynamoDB, would result in significant changes to the application code since the database queries would have to be re-written for Amazon DynamoDB. Therefore, this option is incorrect.

Reference:

https://aws.amazon.com/rds/aurora/faqs/

Domain
Design High-Performing Architectures

---------------------------------------

The DevOps team at an IT company has created a custom VPC (V1) and attached an Internet Gateway (I1) to the VPC. The team has also created a subnet (S1) in this custom VPC and added a route to this subnet's route table (R1) that directs internet-bound traffic to the Internet Gateway. Now the team launches an Amazon EC2 instance (E1) in the subnet S1 and assigns a public IPv4 address to this instance. Next the team also launches a Network Address Translation (NAT) instance (N1) in the subnet S1.

Under the given infrastructure setup, which of the following entities is doing the Network Address Translation for the Amazon EC2 instance E1?

Your answer is correct
Internet Gateway (I1)

Network Address Translation (NAT) instance (N1)

Route Table (R1)

Subnet (S1)

Overall explanation
Correct option:

Internet Gateway (I1)

An Internet Gateway is a horizontally scaled, redundant, and highly available VPC component that allows communication between your VPC and the internet.

An Internet Gateway serves two purposes: to provide a target in your VPC route tables for internet-routable traffic and to perform network address translation (NAT) for instances that have been assigned public IPv4 addresses. Therefore, for instance E1, the Network Address Translation is done by Internet Gateway I1.

Additionally, an Internet Gateway supports IPv4 and IPv6 traffic. It does not cause availability risks or bandwidth constraints on your network traffic.

To enable access to or from the internet for instances in a subnet in a VPC, you must do the following:

Attach an Internet gateway to your VPC.

Add a route to your subnet's route table that directs internet-bound traffic to the internet gateway. If a subnet is associated with a route table that has a route to an internet gateway, it's known as a public subnet. If a subnet is associated with a route table that does not have a route to an internet gateway, it's known as a private subnet.

Ensure that instances in your subnet have a globally unique IP address (public IPv4 address, Elastic IP address, or IPv6 address).

Ensure that your network access control lists and security group rules allow the relevant traffic to flow to and from your instance.

Internet Gateway Overview:  via - https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html

Incorrect options:

Network Address Translation (NAT) instance (N1) - You can use a network address translation (NAT) instance in a public subnet in your VPC to enable instances in the private subnet to initiate outbound IPv4 traffic to the Internet or other AWS services, but prevent the instances from receiving inbound traffic initiated by someone on the Internet. As the instance E1 is in a public subnet, therefore this option is not correct.

Subnet (S1)

Route Table (R1)

A virtual private cloud (VPC) is a virtual network dedicated to your AWS account. A subnet is a range of IP addresses in your VPC. A route table contains a set of rules, called routes, that are used to determine where network traffic is directed. Therefore neither Subnet nor Route Table can be used for Network Address Translation.

References:

https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html

https://docs.aws.amazon.com/vpc/latest/userguide/VPC_NAT_Instance.html

Domain
Design Resilient Architectures

--------------------------

A media startup is looking at hosting their web application on AWS Cloud. The application will be accessed by users from different geographic regions of the world to upload and download video files that can reach a maximum size of 10 gigabytes. The startup wants the solution to be cost-effective and scalable with the lowest possible latency for a great user experience.

As a Solutions Architect, which of the following will you suggest as an optimal solution to meet the given requirements?

Use Amazon EC2 with Amazon ElastiCache for faster distribution of content, while Amazon S3 can be used as a storage service

Use Amazon S3 for hosting the web application and use Amazon CloudFront for faster distribution of content to geographically dispersed users

Use Amazon EC2 with AWS Global Accelerator for faster distribution of content, while using Amazon S3 as storage service

Your answer is correct
Use Amazon S3 for hosting the web application and use Amazon S3 Transfer Acceleration (Amazon S3TA) to reduce the latency that geographically dispersed users might face

Overall explanation
Correct option:

Use Amazon S3 for hosting the web application and use Amazon S3 Transfer Acceleration (Amazon S3TA) to reduce the latency that geographically dispersed users might face

Amazon S3 Transfer Acceleration (S3TA) can speed up content transfers to and from Amazon S3 by as much as 50-500% for long-distance transfer of larger objects. Customers who have either web or mobile applications with widespread users or applications hosted far away from their S3 bucket can experience long and variable upload and download speeds over the Internet. S3 Transfer Acceleration (S3TA) reduces the variability in Internet routing, congestion, and speeds that can affect transfers, and logically shortens the distance to S3 for remote applications.

S3TA improves transfer performance by routing traffic through Amazon CloudFront’s globally distributed Edge Locations and over AWS backbone networks, and by using network protocol optimizations.

For applications interacting with your Amazon S3 buckets through the S3 API from outside of your bucket’s region, S3TA helps avoid the variability in Internet routing and congestion. It does this by routing your uploads and downloads over the AWS global network infrastructure, so you get the benefit of AWS network optimizations.

Incorrect options:

Use Amazon S3 for hosting the web application and use Amazon CloudFront for faster distribution of content to geographically dispersed users - Amazon S3 with Amazon CloudFront is a very powerful way of distributing static content to geographically dispersed users with low latency speeds. If you have objects that are smaller than 1GB or if the data set is less than 1GB in size, you should consider using Amazon CloudFront's PUT/POST commands for optimal performance. The given use case has data larger than 1GB and hence S3 Transfer Acceleration is a better option.

 via - https://aws.amazon.com/s3/faqs/

Use Amazon EC2 with AWS Global Accelerator for faster distribution of content, while using Amazon S3 as storage service- AWS Global Accelerator is a networking service that sends your user’s traffic through Amazon Web Service’s global network infrastructure, improving your internet user performance by up to 60%. With AWS Global Accelerator, you are provided two global static customer-facing IPs to simplify traffic management. On the back end, add or remove your AWS application origins, such as Network Load Balancers, Application Load Balancers, Elastic IPs, and Amazon EC2 Instances, without making user-facing changes. As discussed, AWS Global Accelerator is meant for a different use case and is not meant for increasing the speed of Amazon S3 uploads or downloads.

Use Amazon EC2 with Amazon ElastiCache for faster distribution of content, while Amazon S3 can be used as a storage service - Amazon ElastiCache allows you to seamlessly set up, run, and scale popular open-Source compatible in-memory data stores in the cloud. Build data-intensive apps or boost the performance of your existing databases by retrieving data from high throughput and low latency in-memory data stores. Amazon ElastiCache is a popular choice for real-time use cases like Caching, Session Stores, Gaming, Geospatial Services, Real-Time Analytics, and Queuing. Amazon S3 Transfer Acceleration is a better performing option than opting for Amazon EC2 with Amazon ElastiCache, which is not meant to address the given use-case.

Reference:

[https://aws.amazon.com/s3/transfer-acceleration/](https://aws.amazon.com/s3/transfer-acceleration

https://aws.amazon.com/s3/faqs/

Domain
Design High-Performing Architectures

---------------------

A social media startup uses AWS Cloud to manage its IT infrastructure. The engineering team at the startup wants to perform weekly database rollovers for a MySQL database server using a serverless cron job that typically takes about 5 minutes to execute the database rollover script written in Python. The database rollover will archive the past week’s data from the production database to keep the database small while still keeping its data accessible.

As a solutions architect, which of the following would you recommend as the MOST cost-efficient and reliable solution?

Provision an Amazon EC2 scheduled reserved instance to run the database rollover script to be run via an OS-based weekly cron expression

Create a time-based schedule option within an AWS Glue job to invoke itself every week and run the database rollover script

Provision an Amazon EC2 spot instance to run the database rollover script to be run via an OS-based weekly cron expression

Your answer is correct
Schedule a weekly Amazon EventBridge event cron expression to invoke an AWS Lambda function that runs the database rollover job

Overall explanation
Correct option:

Schedule a weekly Amazon EventBridge event cron expression to invoke an AWS Lambda function that runs the database rollover job

AWS Lambda lets you run code without provisioning or managing servers. You pay only for the compute time you consume. AWS Lambda supports standard rate and cron expressions for frequencies of up to once per minute.

Schedule expressions using rate or cron: 
![image](https://github.com/user-attachments/assets/d75f94e6-e1dd-4dc9-9b86-f8ef649910a0)


Incorrect options:

Create a time-based schedule option within an AWS Glue job to invoke itself every week and run the database rollover script - AWS Glue is a fully managed extract, transform, and load (ETL) service that makes it easy for customers to prepare and load their data for analytics. AWS Glue job is meant to be used for batch ETL data processing and it's not the right fit for running a database rollover script. Although AWS Glue is also serverless, AWS Lambda is a more cost-effective option compared to AWS Glue.

Provision an Amazon EC2 spot instance to run the database rollover script to be run via an OS-based weekly cron expression - A Spot Instance is an unused Amazon EC2 instance that is available for less than the On-Demand price. Because Spot Instances enable you to request unused Amazon EC2 instances at steep discounts, you can lower your Amazon EC2 costs significantly (up to 90% off the On-Demand price). As the Spot Instance runs whenever capacity is available, there is no guarantee that the weekly job will be executed during the defined time window. Additionally, the given use-case requires a serverless solution, therefore this option is incorrect.

Provision an Amazon EC2 scheduled reserved instance to run the database rollover script to be run via an OS-based weekly cron expression - Scheduled Reserved Instances run on a part-time basis. Scheduled Reserved Instances option allows you to use reserve capacity on a recurring daily, weekly, and monthly schedules. Scheduled Reserved Instances are available for one-year terms at 5-10% below On-Demand rates. As the given use-case requires a serverless solution, therefore this option is incorrect.

References:

https://aws.amazon.com/lambda/

https://docs.aws.amazon.com/lambda/latest/dg/services-cloudwatchevents-expressions.html

Domain
Design Cost-Optimized Architectures

--------------

The engineering team at an e-commerce company wants to migrate from Amazon Simple Queue Service (Amazon SQS) Standard queues to FIFO (First-In-First-Out) queues with batching.

As a solutions architect, which of the following steps would you have in the migration checklist? (Select three)

Convert the existing standard queue into a FIFO (First-In-First-Out) queue

Your selection is correct
Make sure that the throughput for the target FIFO (First-In-First-Out) queue does not exceed 3,000 messages per second

Make sure that the throughput for the target FIFO (First-In-First-Out) queue does not exceed 300 messages per second

Your selection is correct
Make sure that the name of the FIFO (First-In-First-Out) queue ends with the .fifo suffix

Your selection is correct
Delete the existing standard queue and recreate it as a FIFO (First-In-First-Out) queue

Make sure that the name of the FIFO (First-In-First-Out) queue is the same as the standard queue

Overall explanation
Correct options:

Delete the existing standard queue and recreate it as a FIFO (First-In-First-Out) queue

Make sure that the name of the FIFO (First-In-First-Out) queue ends with the .fifo suffix

Make sure that the throughput for the target FIFO (First-In-First-Out) queue does not exceed 3,000 messages per second

Amazon Simple Queue Service (SQS) is a fully managed message queuing service that enables you to decouple and scale microservices, distributed systems, and serverless applications. Amazon SQS eliminates the complexity and overhead associated with managing and operating message oriented middleware, and empowers developers to focus on differentiating work. Using Amazon SQS, you can send, store, and receive messages between software components at any volume, without losing messages or requiring other services to be available.

Amazon SQS offers two types of message queues. Standard queues offer maximum throughput, best-effort ordering, and at-least-once delivery. SQS FIFO queues are designed to guarantee that messages are processed exactly once, in the exact order that they are sent.

By default, FIFO queues support up to 3,000 messages per second with batching, or up to 300 messages per second (300 send, receive, or delete operations per second) without batching. Therefore, using batching you can meet a throughput requirement of upto 3,000 messages per second.

The name of a FIFO queue must end with the .fifo suffix. The suffix counts towards the 80-character queue name limit. To determine whether a queue is FIFO, you can check whether the queue name ends with the suffix.

If you have an existing application that uses standard queues and you want to take advantage of the ordering or exactly-once processing features of FIFO queues, you need to configure the queue and your application correctly. You can't convert an existing standard queue into a FIFO queue. To make the move, you must either create a new FIFO queue for your application or delete your existing standard queue and recreate it as a FIFO queue.

Incorrect options:

Convert the existing standard queue into a FIFO (First-In-First-Out) queue

Make sure that the name of the FIFO (First-In-First-Out) queue is the same as the standard queue - The name of a FIFO queue must end with the .fifo suffix.

Make sure that the throughput for the target FIFO (First-In-First-Out) queue does not exceed 300 messages per second - By default, FIFO queues support up to 3,000 messages per second with batching.

References:

https://aws.amazon.com/sqs/faqs/

https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html

Domain
Design Resilient Architectures

---------------

A leading online gaming company is migrating its flagship application to AWS Cloud for delivering its online games to users across the world. The company would like to use a Network Load Balancer to handle millions of requests per second. The engineering team has provisioned multiple instances in a public subnet and specified these instance IDs as the targets for the NLB.

As a solutions architect, can you help the engineering team understand the correct routing mechanism for these target instances?

Traffic is routed to instances using the primary elastic IP address specified in the primary network interface for the instance

Traffic is routed to instances using the instance ID specified in the primary network interface for the instance

Your answer is incorrect
Traffic is routed to instances using the primary public IP address specified in the primary network interface for the instance

Correct answer
Traffic is routed to instances using the primary private IP address specified in the primary network interface for the instance

Overall explanation
Correct option:

Traffic is routed to instances using the primary private IP address specified in the primary network interface for the instance

A Network Load Balancer functions at the fourth layer of the Open Systems Interconnection (OSI) model. It can handle millions of requests per second. After the load balancer receives a connection request, it selects a target from the target group for the default rule. It attempts to open a TCP connection to the selected target on the port specified in the listener configuration.

Request Routing and IP Addresses -

If you specify targets using an instance ID, traffic is routed to instances using the primary private IP address specified in the primary network interface for the instance. The load balancer rewrites the destination IP address from the data packet before forwarding it to the target instance.

If you specify targets using IP addresses, you can route traffic to an instance using any private IP address from one or more network interfaces. This enables multiple applications on an instance to use the same port. Note that each network interface can have its security group. The load balancer rewrites the destination IP address before forwarding it to the target.

Incorrect options:

Traffic is routed to instances using the primary public IP address specified in the primary network interface for the instance - If you specify targets using an instance ID, traffic is routed to instances using the primary private IP address specified in the primary network interface for the instance. So public IP address cannot be used to route the traffic to the instance.

Traffic is routed to instances using the primary elastic IP address specified in the primary network interface for the instance - If you specify targets using an instance ID, traffic is routed to instances using the primary private IP address specified in the primary network interface for the instance. So elastic IP address cannot be used to route the traffic to the instance.

Traffic is routed to instances using the instance ID specified in the primary network interface for the instance - You cannot use instance ID to route traffic to the instance. This option is just added as a distractor.

References:

https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html

https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html

Domain
Design High-Performing Architectures

-------------------------------

An engineering lead is designing a VPC with public and private subnets. The VPC and subnets use IPv4 CIDR blocks. There is one public subnet and one private subnet in each of three Availability Zones (AZs) for high availability. An internet gateway is used to provide internet access for the public subnets. The private subnets require access to the internet to allow Amazon EC2 instances to download software updates.

Which of the following options represents the correct solution to set up internet access for the private subnets?

Set up three Internet gateways, one in each private subnet in each AZ. Create a custom route table for each AZ that forwards non-local traffic to the Internet gateway in its AZ

Your answer is incorrect
Set up three egress-only internet gateways, one in each public subnet in each AZ. Create a custom route table for each AZ that forwards non-local traffic to the egress-only internet gateway in its AZ

Correct answer
Set up three NAT gateways, one in each public subnet in each AZ. Create a custom route table for each AZ that forwards non-local traffic to the NAT gateway in its AZ

Set up three NAT gateways, one in each private subnet in each AZ. Create a custom route table for each AZ that forwards non-local traffic to the NAT gateway in its AZ

Overall explanation
Correct option:

Set up three NAT gateways, one in each public subnet in each AZ. Create a custom route table for each AZ that forwards non-local traffic to the NAT gateway in its AZ

You can use a network address translation (NAT) gateway to enable instances in a private subnet to connect to the internet or other AWS services, but prevent the internet from initiating a connection with those instances.

To create a NAT gateway, you must specify the public subnet in which the NAT gateway should reside. You must also specify an Elastic IP address to associate with the NAT gateway when you create it. The Elastic IP address cannot be changed after you associate it with the NAT Gateway. After you've created a NAT gateway, you must update the route table associated with one or more of your private subnets to point internet-bound traffic to the NAT gateway. This enables instances in your private subnets to communicate with the internet.

Each NAT gateway is created in a specific Availability Zone and implemented with redundancy in that zone.

If you have resources in multiple Availability Zones and they share one NAT gateway, and if the NAT gateway’s Availability Zone is down, resources in the other Availability Zones lose internet access. To create an Availability Zone-independent architecture, create a NAT gateway in each Availability Zone and configure your routing to ensure that resources use the NAT gateway in the same Availability Zone.

How NAT gateway works:  via - https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html
![image](https://github.com/user-attachments/assets/618c8b1d-19da-4ead-9e54-3171b24fda36)


Incorrect options:

Set up three NAT gateways, one in each private subnet in each AZ. Create a custom route table for each AZ that forwards non-local traffic to the NAT gateway in its AZ - NAT gateways need to be set up in public subnets, so this option is incorrect.

Set up three Internet gateways, one in each private subnet in each AZ. Create a custom route table for each AZ that forwards non-local traffic to the Internet gateway in its AZ - Internet gateways cannot be provisioned in private subnets of a VPC.

Set up three egress-only internet gateways, one in each public subnet in each AZ. Create a custom route table for each AZ that forwards non-local traffic to the egress-only internet gateway in its AZ - An Egress-only Internet gateway is a horizontally scaled, redundant, and highly available VPC component that allows outbound communication over IPv6 from instances in your VPC to the internet, and prevents the internet from initiating an IPv6 connection with your instances. The given use-case is for IPv4 traffic, hence an Egress-only Internet gateway is not an option.

Reference:

https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html

Domain
Design Secure Architectures

----------------------

An IT company hosts windows based applications on its on-premises data center. The company is looking at moving the business to the AWS Cloud. The cloud solution should offer shared storage space that multiple applications can access without a need for replication. Also, the solution should integrate with the company's self-managed Active Directory domain.

Which of the following solutions addresses these requirements with the minimal integration effort?

Use File Gateway of AWS Storage Gateway to create a hybrid storage solution

Use Amazon FSx for Lustre as a shared storage solution with millisecond latencies

Your answer is correct
Use Amazon FSx for Windows File Server as a shared storage solution

Use Amazon Elastic File System (Amazon EFS) as a shared storage solution

Overall explanation
Correct option:

Use Amazon FSx for Windows File Server as a shared storage solution

Amazon FSx for Windows File Server provides fully managed, highly reliable, and scalable file storage that is accessible over the industry-standard Server Message Block (SMB) protocol. It is built on Windows Server, delivering a wide range of administrative features such as user quotas, end-user file restore, and Microsoft Active Directory (AD) integration. It offers single-AZ and multi-AZ deployment options, fully managed backups, and encryption of data at rest and in transit. You can optimize cost and performance for your workload needs with SSD and HDD storage options; and you can scale storage and change the throughput performance of your file system at any time.

With Amazon FSx, you get highly available and durable file storage starting from $0.013 per GB-month. Data deduplication enables you to optimize costs even further by removing redundant data. You can increase your file system storage and scale throughput capacity at any time, making it easy to respond to changing business needs. There are no upfront costs or licensing fees.

How Amazon FSx for Windows File Server works:  via - https://aws.amazon.com/fsx/windows/

Incorrect options:

Use File Gateway of AWS Storage Gateway to create a hybrid storage solution - AWS Storage Gateway connects an on-premises software appliance with cloud-based storage to provide seamless integration between your on-premises IT environment and the AWS storage infrastructure. Storage Gateway uses Amazon S3 to store data on AWS Cloud and from here the on-premises data can seamlessly integrate with Cloud services. It is not suited to be used as a shared storage space that multiple applications can access in parallel.

Use Amazon FSx for Lustre as a shared storage solution with millisecond latencies - Amazon FSx for Lustre is a fully managed service that provides cost-effective, high-performance storage for compute workloads. Many workloads such as machine learning, high performance computing (HPC), video rendering, and financial simulations depend on compute instances accessing the same set of data through high-performance shared storage. Lustre is Linux based, hence it is not the right choice since the use case is about Windows-based applications.

Use Amazon Elastic File System (Amazon EFS) as a shared storage solution - Amazon Elastic File System (Amazon EFS) provides a simple, scalable, fully managed elastic NFS file system for use with AWS Cloud services and on-premises resources. Amazon EFS is a powerful, shared storage solution that would have been the right answer if the customer systems were Linux based. Amazon EFS is compatible with only Linux-based AMIs for Amazon EC2.

Reference:

https://aws.amazon.com/fsx/windows/

Domain
Design Resilient Architectures

-----------------------------------

A media company has its corporate headquarters in Los Angeles with an on-premises data center using an AWS Direct Connect connection to the AWS VPC. The branch offices in San Francisco and Miami use AWS Site-to-Site VPN connections to connect to the AWS VPC. The company is looking for a solution to have the branch offices send and receive data with each other as well as with their corporate headquarters.

As a solutions architect, which of the following AWS services would you recommend addressing this use-case?

VPC Endpoint

Your answer is correct
AWS VPN CloudHub

Software VPN

VPC Peering connection

Overall explanation
Correct option:

AWS VPN CloudHub

If you have multiple AWS Site-to-Site VPN connections, you can provide secure communication between sites using the AWS VPN CloudHub. This enables your remote sites to communicate with each other, and not just with the VPC. Sites that use AWS Direct Connect connections to the virtual private gateway can also be part of the AWS VPN CloudHub. The VPN CloudHub operates on a simple hub-and-spoke model that you can use with or without a VPC. This design is suitable if you have multiple branch offices and existing internet connections and would like to implement a convenient, potentially low-cost hub-and-spoke model for primary or backup connectivity between these remote offices.

Per the given use-case, the corporate headquarters has an AWS Direct Connect connection to the VPC and the branch offices have Site-to-Site VPN connections to the VPC. Therefore using the AWS VPN CloudHub, branch offices can send and receive data with each other as well as with their corporate headquarters.

AWS VPN CloudHub:  via - https://docs.aws.amazon.com/vpn/latest/s2svpn/VPN_CloudHub.html
![image](https://github.com/user-attachments/assets/c2559fdb-e7ba-4ba8-be02-8b4f8e672e35)


Incorrect options:

VPC Endpoint - A VPC endpoint enables you to privately connect your VPC to supported AWS services and VPC endpoint services powered by AWS PrivateLink without requiring an internet gateway, NAT device, VPN connection, or AWS Direct Connect connection. Instances in your VPC do not require public IP addresses to communicate with resources in the service. AWS PrivateLink simplifies the security of data shared with cloud-based applications by eliminating the exposure of data to the public Internet. When you use VPC endpoint, the traffic between your VPC and the other AWS service does not leave the Amazon network, therefore this option cannot be used to send and receive data between the remote branch offices of the company.

VPC Peering connection - A VPC peering connection is a networking connection between two VPCs that enables you to route traffic between them using private IPv4 addresses or IPv6 addresses. Instances in either VPC can communicate with each other as if they are within the same network. VPC peering facilitates a connection between two VPCs within the AWS network, therefore this option cannot be used to send and receive data between the remote branch offices of the company.

Software VPN - Amazon VPC offers you the flexibility to fully manage both sides of your Amazon VPC connectivity by creating a VPN connection between your remote network and a software VPN appliance running in your Amazon VPC network. Since Software VPN just handles connectivity between the remote network and Amazon VPC, therefore it cannot be used to send and receive data between the remote branch offices of the company.

References:

https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/aws-vpn-cloudhub-network-to-amazon.html

https://docs.aws.amazon.com/vpn/latest/s2svpn/VPN_CloudHub.html

Domain
Design Secure Architectures

-------------------------------------

The development team at a retail company wants to optimize the cost of Amazon EC2 instances. The team wants to move certain nightly batch jobs to spot instances. The team has hired you as a solutions architect to provide the initial guidance.

Which of the following would you identify as CORRECT regarding the capabilities of spot instances? (Select three)

Correct selection
When you cancel an active spot request, it does not terminate the associated instance

Spot Fleets cannot maintain target capacity by launching replacement instances after Spot Instances in the fleet are terminated

Your selection is incorrect
When you cancel an active spot request, it terminates the associated instance as well

Your selection is correct
If a spot request is persistent, then it is opened again after your Spot Instance is interrupted

If a spot request is persistent, then it is opened again after you stop the Spot Instance

Your selection is correct
Spot Fleets can maintain target capacity by launching replacement instances after Spot Instances in the fleet are terminated

Overall explanation
Correct options:

If a spot request is persistent, then it is opened again after your Spot Instance is interrupted

A Spot Instance is an unused Amazon EC2 instance that is available for less than the On-Demand price. Because Spot Instances enable you to request unused Amazon EC2 instances at steep discounts, you can lower your Amazon EC2 costs significantly. The hourly price for a Spot Instance is called a Spot price. The Spot price of each instance type in each Availability Zone is set by Amazon EC2 and adjusted gradually based on the long-term supply of and demand for Spot Instances.

A Spot Instance request is either one-time or persistent. If the spot request is persistent, the request is opened again after your Spot Instance is interrupted. If the request is persistent and you stop your Spot Instance, the request only opens after you start your Spot Instance.

How Spot requests work:  via - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-requests.html

Spot Fleets can maintain target capacity by launching replacement instances after Spot Instances in the fleet are terminated

A Spot Fleet is a set of Spot Instances and optionally On-Demand Instances that is launched based on criteria that you specify. The Spot Fleet selects the Spot capacity pools that meet your needs and launches Spot Instances to meet the target capacity for the fleet. By default, Spot Fleets are set to maintain target capacity by launching replacement instances after Spot Instances in the fleet are terminated. You can submit a Spot Fleet as a one-time request, which does not persist after the instances have been terminated. You can include On-Demand Instance requests in a Spot Fleet request.

When you cancel an active spot request, it does not terminate the associated instance

If your Spot Instance request is active and has an associated running Spot Instance, or your Spot Instance request is disabled and has an associated stopped Spot Instance, canceling the request does not terminate the instance; you must terminate the running Spot Instance manually. Moreover, to cancel a persistent Spot request and terminate its Spot Instances, you must cancel the Spot request first and then terminate the Spot Instances.

Incorrect options:

When you cancel an active spot request, it terminates the associated instance as well - If your Spot Instance request is active and has an associated running Spot Instance, then canceling the request does not terminate the instance; you must terminate the running Spot Instance manually. So, this option is incorrect.

If a spot request is persistent, then it is opened again after you stop the Spot Instance - If the request is persistent and you stop your Spot Instance, the request only opens after you start your Spot Instance. So, this option is incorrect.

Spot Fleets cannot maintain target capacity by launching replacement instances after Spot Instances in the fleet are terminated - As mentioned above, Spot Fleets can maintain target capacity by launching replacement instances after Spot Instances in the fleet are terminated.

References:

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-requests.html

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-fleet.html

Domain
Design Cost-Optimized Architectures

---------------------------

A company has set up AWS Organizations to manage several departments running their own AWS accounts. The departments operate from different countries and are spread across various AWS Regions. The company wants to set up a consistent resource provisioning process across departments so that each resource follows pre-defined configurations such as using a specific type of Amazon EC2 instances, specific IAM roles for AWS Lambda functions, etc.

As a solutions architect, which of the following options would you recommend for this use-case?

Correct answer
Use AWS CloudFormation StackSets to deploy the same template across AWS accounts and regions

Use AWS Resource Access Manager (AWS RAM) to deploy the same template across AWS accounts and regions

Your answer is incorrect
Use AWS CloudFormation templates to deploy the same template across AWS accounts and regions

Use AWS CloudFormation stacks to deploy the same template across AWS accounts and regions

Overall explanation
Correct option:

Use AWS CloudFormation StackSets to deploy the same template across AWS accounts and regions

AWS CloudFormation StackSet extends the functionality of stacks by enabling you to create, update, or delete stacks across multiple accounts and regions with a single operation. A stack set lets you create stacks in AWS accounts across regions by using a single AWS CloudFormation template. Using an administrator account of an "AWS Organization", you define and manage an AWS CloudFormation template, and use the template as the basis for provisioning stacks into selected target accounts of an "AWS Organization" across specified regions.

AWS CloudFormation StackSets:  via - https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html

Incorrect options:

Use AWS CloudFormation templates to deploy the same template across AWS accounts and regions - AWS Cloudformation template is a JSON or YAML-format, text-based file that describes all the AWS resources you need to deploy to run your application. A template acts as a blueprint for a stack. AWS CloudFormation templates cannot be used to deploy the same template across AWS accounts and regions.

Use AWS CloudFormation stacks to deploy the same template across AWS accounts and regions - AWS CloudFormation stack is a set of AWS resources that are created and managed as a single unit when AWS CloudFormation instantiates a template. A stack cannot be used to deploy the same template across AWS accounts and regions.

Use AWS Resource Access Manager (AWS RAM) to deploy the same template across AWS accounts and regions - AWS Resource Access Manager (AWS RAM) is a service that enables you to easily and securely share AWS resources with any AWS account or within your AWS Organization. Resource Access Manager cannot be used to deploy the same template across AWS accounts and regions.

References:

https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html

https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-whatis-howdoesitwork.html

Domain
Design High-Performing Architectures

---------------------------

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
