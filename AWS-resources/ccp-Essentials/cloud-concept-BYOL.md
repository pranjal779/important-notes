An organization is migrating its Microsoft SQL Server to AWS Cloud; however, they have already purchased a software license from Microsoft for its SQL Server. Unfortunately, the license does not include Software Assurance.

Is it possible for an organization to Bring-Your-Own-License (BYOL) to AWS, and how would they achieve this?

Import your license via AWS License Manager. Use any compute service you like

AWS License Manager does not support all computing services.

Amazon Relational Database Service (RDS) via AWS License Manager

SELECTED
Amazon EC2 Dedicated Host integrated with AWS License Manager.

Bring existing licenses to Dedicated Hosts

Amazon EC2 offers Dedicated Hosts, which allow you to access fully dedicated hardware for your use. You can use your own licensed software on dedicated infrastructure, even without Software Assurance. Please visit this FAQ section for more information on bringing licenses without Software Assurance or License Mobility benefits.

Amazon EC2 Dedicated Host is also integrated with AWS License Manager, a service that helps you manage your software licenses, including Windows Server and SQL Server licenses. In License Manager, you can specify your licensing terms for governing license usage, and easily track licenses for compliance and auditing. You can also specify Dedicated Host management preferences for host allocation and host capacity utilization. Once set up, AWS takes care of these administrative tasks on your behalf, so that you can seamlessly launch virtual machines (instances) on Dedicated Hosts just like you would launch an EC2 instance with AWS-provided licenses.

Eligible Products

Microsoft software covered by the Microsoft Product Terms can be deployed on AWS using Amazon EC2 Dedicated Hosts. Examples include:

Microsoft Windows Server
Microsoft SQL Server
Microsoft Remote Desktop Services (user CALs)
Microsoft Exchange Server
Microsoft SharePoint Server
Microsoft System Center
Microsoft Dynamics products
https://aws.amazon.com/windows/resources/licensing/

EXPLANATION
Understand the impact of software licensing costs when moving to the cloud.

A similar question appeared on the exam; This question was much more complex than others, so we provided a similarly tricky question.

https://aws.amazon.com/windows/resources/licensing/

https://www.microsoft.com/en-us/licensing/licensing-programs/software-assurance-default

YOUR NOTES
Domain 1: Cloud Concepts
