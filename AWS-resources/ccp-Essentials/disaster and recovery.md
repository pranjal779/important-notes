A Site Reliability Engineer has been tasked with implementing a Disaster Recovery (DR) strategy at the lowest cost possible.

Which DR strategy will meet this requirement?

Multi-site active

You can run your workload simultaneously in multiple Regions as part of a multi-site active/active or hot standby active/passive strategy. Multi-site active/active serves traffic from all regions to which it is deployed. In contrast, hot standby serves traffic only from a single region, and the other Region(s) are only used for disaster recovery. With a multi-site active/active approach, users can access your workload in any of the Regions in which it is deployed. This approach is the most complex and costly approach to disaster recovery, but it can reduce your recovery time to near zero for most disasters with the correct technology choices and implementation (however, data corruption may need to rely on backups, which usually results in a non-zero recovery point). Hot standby uses an active/passive configuration where users are only directed to a single region, and DR regions do not take traffic. Most customers find that if they stand up a full environment in the second Region, it makes sense to use it active/active. Alternatively, if you do not want to use both Regions to handle user traffic, Warm Standby offers a more economical and operationally less complex approach.

Pilot Light

With the pilot light approach, you replicate your data from one Region to another and provision a copy of your core workload infrastructure. Resources that support data replication and back-ups, such as databases and object storage, are always on. Other elements, such as application servers, are loaded with application code and configurations, but are switched off and are only used during testing or when disaster recovery failover is invoked. Unlike the backup and restore approach, your core infrastructure is always available, and you always have the option to quickly provision a full-scale production environment by switching on and scaling out your application servers.

Warm Standby

SELECTED
The warm standby approach involves ensuring that there is a scaled-down, but a fully functional, copy of your production environment in another Region. This approach extends the pilot light concept and decreases the time to recovery because your workload is always-on in another Region. This approach also allows you to perform or implement continuous testing more easily to increase confidence in your ability to recover from a disaster.

Backup and Restore

Backup and restore is a suitable approach for mitigating against data loss or corruption. This approach can also be used to mitigate against a regional disaster by replicating data to other AWS Regions, or to mitigate lack of redundancy for workloads deployed to a single Availability Zone. In addition to data, you must redeploy the infrastructure, configuration, and application code in the recovery Region. To enable infrastructure to be redeployed quickly without errors, you should always deploy infrastructure as code (IaC) using services such as AWS CloudFormation or the AWS Cloud Development Kit (CDK). Without IaC, restoring workloads in the recovery Region may be complex, which will lead to increased recovery times and possibly exceed your RTO. In addition to user data, be sure to also back up code and configuration, including Amazon Machine Images (AMIs) you use to create Amazon EC2 instances. You can use AWS CodePipeline to automate the redeployment of application code and configuration.

EXPLANATION
Disaster recovery strategies available from lowest cost to greatest cost - Backup and Restore - Pilot Light - Warm Standby - Multi-Site Active

There is a diagram that illustrates the different strategies. It's important to know all of them. https://docs.aws.amazon.com/whitepapers/latest/disaster-recovery-workloads-on-aws/disaster-recovery-options-in-the-cloud.html
