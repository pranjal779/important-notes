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

----------------------------

Which is a significant financial benefit of shifting on-premises data center systems to AWS?

Replaces upfront capital expenses (CAPEX) with low variable costs over time

This statement is correct. When organizations move from on-premises data centers to cloud services like AWS, they shift from a CAPEX model to an OPEX model. In the CAPEX model, companies incur substantial upfront costs for purchasing and maintaining physical hardware and infrastructure. When they transition to the cloud, these upfront costs are significantly reduced or eliminated, as the cloud provider owns the infrastructure. Instead, the organization pays for the services it consumes, typically on a variable cost basis, which can adjust according to the organization's usage. This model provides flexibility and can lead to cost savings, particularly for organizations that experience fluctuating demands.

Overview of Amazon Web Services

Replaces variable operational expenses (OPEX) with low upfront capital expenses (CAPEX) over time

This statement is incorrect as it suggests a reverse transition from the typical cloud migration pathway. Generally, cloud migration involves moving away from high CAPEX (associated with purchasing and maintaining on-premises hardware) to a model where costs are more operational and variable (OPEX). The cloud model primarily reduces CAPEX while introducing variable OPEX based on usage, not the other way around.

CAPEX upfront costs are lower, adding increased privacy and security as well as computing power over time

This statement is incorrect and conflates several aspects. First, the move to the cloud typically does not lower upfront CAPEX; instead, it shifts costs from CAPEX to OPEX. The mention of "increased privacy and security" is also misleading in this context, as the move to the cloud does not inherently increase privacy and security; these aspects depend on the specific implementations and configurations within the cloud environment. While cloud providers do offer robust security features, it's up to the organizations to configure and manage them correctly. As for "computing power," while cloud services do offer the ability to scale computing resources, this is not directly related to CAPEX or the initial financial comparison between on-premises and cloud setups.

Replaces upfront operational expenses (OPEX) with low variable operational expenses (OPEX) over time

SELECTED
This statement is incorrect because it conflates operational expenses with themselves, which does not make sense in the context of financial modeling. Operational expenses (OPEX) are the ongoing costs for running a product, business, or system. In the context of data centers, OPEX includes costs like electricity, cooling, and IT labor. When moving to the cloud, these expenses are typically reduced as the cloud provider assumes responsibility for the physical infrastructure, leading to potentially lower operational costs for the organization. However, the organization still incurs operational expenses, now in the form of cloud service fees, which vary based on consumption and the services used.

----------------------------

Your design team is planning to develop an application that will be hosted on the AWS Cloud. One of the main non-functional requirements is:

Reduce inter-dependencies so that failures in one component do not affect other components.

Which of the following concepts does this requirement relate to?

Decoupling

SELECTED
Correct. Decoupling refers to the practice of designing system components in such a way that they are minimally dependent on each other. This is crucial in ensuring that a failure in one component does not cascade and affect other parts of the system. In the context of the requirement to reduce inter-dependencies, decoupling is directly relevant because it aims to isolate components, thereby enhancing the system's resilience and reliability. By decoupling components, you allow each part of the application to function independently, reducing the risk of widespread system failures and simplifying maintenance and updates.

Aggregation

Incorrect. Aggregation is the process of combining multiple elements into a single entity. In software design, this often involves grouping data or functionalities together. While aggregation can simplify access and manipulation of data, it does not inherently address the issue of inter-dependencies between components. In fact, aggregation can sometimes increase dependencies, as components rely on aggregated data or services. Consequently, aggregation is not the concept that directly relates to the requirement of reducing inter-dependencies to avoid failure impact.

Segregation

Incorrect. Segregation refers to separating components or services to ensure they function independently. While similar to decoupling, segregation is more about the physical or logical separation of components, often for security or organizational reasons. Although segregation can help in isolating components and preventing failures from spreading, it is not as specifically focused on reducing inter-dependencies as decoupling. Decoupling is the broader and more relevant concept when it comes to designing systems where components are independently operable, thereby directly addressing the requirement to minimize the impact of component failures.

Integration

Incorrect. Integration involves combining different components or systems to work together as a cohesive whole. While integration is important for enabling different parts of an application to communicate and work together, it inherently increases inter-dependencies. This means that if one component fails, it could potentially disrupt the integrated system. Therefore, integration does not align with the requirement to reduce inter-dependencies and mitigate the impact of failures across components. Instead, integration focuses on connectivity and cooperation between parts, which contrasts with the goal of minimizing inter-dependencies.
