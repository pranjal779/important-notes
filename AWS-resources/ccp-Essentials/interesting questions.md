When architecting for the cloud AWS has a best practice called Design for failure and nothing will fail. Which of the following would provide the greatest amount of fault-tolerance?

Deploying your application across multiple Edge Locations

Edge Locations are used by CloudFront. CloudFront is a CDN that will create cached copies of your static content to multiple Edge Locations. The purpose of a CDN is to improve load times of your content by providing nearby cache copies instead of fetching your content from a faraway data center. Since the question is talking about an application which suggests dynamic content and Edge Locations are used with CloudFront which is for static content this should indicate to you this is not the correct answer.

Utilizing a Load Balancer and Auto Scaling Groups

SELECTED
A Load Balancer can distribute traffic across multiple Availability Zones and an Auto Scaling Group can ensure a minimum amount of instances are always running. Both of these services contribute to building fault-tolerant system. The reason this is not the correct answer is because this only allows us to fail between multiple Availability Zones since a Load Balancer can not distribute traffic across regions. In order to do this we would need Route53 which could fail over traffic to two different Load Balancer in two different Regions. Since we have another question that has Region and AZ fail over its is the more correct answer.

Setting CloudWatch Events to create scheduled automated backups.

In https://media.amazonwebservices.com/AWSCloudBest_Practices.pdf on Page 12 you can see that utilizing CloudWatch is a tactic would contribute to architecting fault-tolerant system. The reason this is not the correct answer is because having a backup does not guarantee the chance of downtime and its important that you have multiple instances already running you can immediately fail over to.

Deploying an application across multiple Availability Zones and Regions

Each AZ is a set of one or more data centers. By deploying your AWS resources to multiple Availability Zones , you are designing with failure with mind. So if one AZ were to go down , the other AZ’s would still be up and running and hence your application would be more fault tolerant.

------------

Where can a customer go to get more detail about Amazon Elastic Compute Cloud (Amazon EC2) billing activity that took place 3 months ago?

AWS Trusted Advisor Dashboard

SELECTED
AWS Trusted Advisor inspects your AWS environment and makes recommendations when opportunities exist to save money, improve system availability and performance, or help close security gaps. Some cost optimization checks for Amazon EC2 instances are:

Consolidation for Microsoft SQL
Over-provisioned for Microsoft SQL Server
Reserved Instance Lease Expiration
Reserved Instance Optimization
Low Utilization of EC2 Instances
Resources:

AWS Trusted Advisor
Cost optimization
Amazon EC2 Dashboard

AWS Cloud Trail logs stored in Amazon Simple StorageService (Amazon S3)


Correct ans > AWS Cost Explorer

Cost Explorer is a free tool that you can use to view your costs. You can view data up to the last 12 months, forecast how much you are likely to spend for the next three months, and get recommendations for what Reserved Instances to purchase.

Analyzing Your Costs with Cost Explorer

------------------

Which of the following features of an Amazon VPC allows your VPC to span multiple Availability Zones?

None of these

Subnet

SELECTED
A subnet must reside within a single AZ

Route Tables

Network Access Control Lists

EXPLANATION
By default, a VPC spans all of the Availability Zones in a Region.

Overview of VPCs and subnets
