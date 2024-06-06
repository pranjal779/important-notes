![image](https://github.com/pranjal779/important-notes/assets/50409572/9bf8f106-b67d-4bf0-8f15-939b8a2becb9)

![image](https://github.com/pranjal779/important-notes/assets/50409572/1436c1c7-1cae-4d71-85ea-e9c11300dc7c)

![image](https://github.com/pranjal779/important-notes/assets/50409572/79ab9bdd-e069-4f17-8ed4-25a2574e29ca)

# Elastic Load Balancing

Elastic Load Balancing is the AWS service that automatically distributes incoming application traffic across multiple resources, such as Amazon EC2 instances. 

A load balancer acts as a single point of contact for all incoming web traffic to your Auto Scaling group. This means that as you add or remove Amazon EC2 instances in response to the amount of incoming traffic, these requests route to the load balancer first. Then, the requests spread across multiple resources that will handle them. For example, if you have multiple Amazon EC2 instances, Elastic Load Balancing distributes the workload across the multiple instances so that no single instance has to carry the bulk of it. 

Although Elastic Load Balancing and Amazon EC2 Auto Scaling are separate services, they work together to help ensure that applications running in Amazon EC2 can provide high performance and availability. 

## Example: Elastic Load Balancing

<img width="542" alt="tZBpJWIIb7bbCMlu_gxyNgUGrmnijDl62" src="https://github.com/pranjal779/important-notes/assets/50409572/2bfb2a61-192f-4e60-8ff5-eff83673ba17">

### Low-demand period

Here’s an example of how Elastic Load Balancing works. Suppose that a few customers have come to the coffee shop and are ready to place their orders. 

If only a few registers are open, this matches the demand of customers who need service. The coffee shop is less likely to have open registers with no customers. In this example, you can think of the registers as Amazon EC2 instances.

<img width="802" alt="WhreF11pnM9jPc6p_q_fQ0lM9jrHOGE2v" src="https://github.com/pranjal779/important-notes/assets/50409572/c5a125c7-f6f8-44dd-a81e-3c3ba95c3c64">

### High-demand period

Throughout the day, as the number of customers increases, the coffee shop opens more registers to accommodate them. 

Additionally, a coffee shop employee directs customers to the most appropriate register so that the number of requests can evenly distribute across the open registers. You can think of this coffee shop employee as a load balancer. 
