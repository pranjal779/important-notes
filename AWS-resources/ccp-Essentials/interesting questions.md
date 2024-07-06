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
