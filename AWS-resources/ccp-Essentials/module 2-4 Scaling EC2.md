Scalability

Scalability involves beginning with only the resources you need and designing your architecture to automatically respond to changing demand by scaling out or in. As a result, you pay for only the resources you use. 
You don’t have to worry about a lack of computing capacity to meet your customers’ needs.

If you wanted the scaling process to happen automatically, which AWS service would you use? The AWS service that provides this functionality for Amazon EC2 instances is Amazon EC2 Auto Scaling.

Amazon EC2 Auto Scaling

If you’ve tried to access a website that wouldn’t load and frequently timed out, the website might have received more requests than it was able to handle. 
This situation is similar to waiting in a long line at a coffee shop, when there is only one barista present to take orders from customers.

Bar graph depicting demand and unused capacity over a 7-day period.
<img width="613" alt="kXbKWJIt-XaEGl-r_EVco4LYrtdoEY2Je" src="https://github.com/pranjal779/important-notes/assets/50409572/49e2acaa-165b-465e-8900-6fc20caaf560">



Amazon EC2 Auto Scaling enables you to automatically add or remove Amazon EC2 instances in response to changing application demand. 
By automatically scaling your instances in and out as needed, you can maintain a greater sense of application availability.

Within Amazon EC2 Auto Scaling, you can use two approaches: dynamic scaling and predictive scaling.

Dynamic scaling responds to changing demand. 
Predictive scaling automatically schedules the right number of Amazon EC2 instances based on predicted demand.


Example: Amazon EC2 Auto Scaling

In the cloud, computing power is a programmatic resource, so you can take a more flexible approach to the issue of scaling. By adding Amazon EC2 Auto Scaling to an application, you can add new instances to the application when necessary and terminate them when no longer needed.

Suppose that you are preparing to launch an application on Amazon EC2 instances. When configuring the size of your Auto Scaling group, you might set the minimum number of Amazon EC2 instances at one. 
This means that at all times, there must be at least one Amazon EC2 instance running.
<img width="651" alt="ycQqvQ-dNtZo8148_f8VZ-ZFC2TOC7k5B" src="https://github.com/pranjal779/important-notes/assets/50409572/e4821e85-1a1e-40d5-a6ca-96640fb256cd">

When you create an Auto Scaling group, you can set the minimum number of Amazon EC2 instances. 
The minimum capacity is the number of Amazon EC2 instances that launch immediately after you have created the Auto Scaling group. In this example, the Auto Scaling group has a minimum capacity of one Amazon EC2 instance.



Next, you can set the desired capacity at two Amazon EC2 instances even though your application needs a minimum of a single Amazon EC2 instance to run.

If you do not specify the desired number of Amazon EC2 instances in an Auto Scaling group, the desired capacity defaults to your minimum capacity.

The third configuration that you can set in an Auto Scaling group is the maximum capacity. 
For example, you might configure the Auto Scaling group to scale out in response to increased demand, but only to a maximum of four Amazon EC2 instances.

Because Amazon EC2 Auto Scaling uses Amazon EC2 instances, you pay for only the instances you use, when you use them. You now have a cost-effective architecture that provides the best customer experience while reducing expenses.
