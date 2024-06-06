- Tightly coupled architecture

More reliable architecture
- Loosely coupled architecture

# Amazon SQS and Amazon SNS

<img width="196" alt="5Pboi5Qu6ksmOGSe_6maw1a" src="https://github.com/pranjal779/important-notes/assets/50409572/71b8c8b2-4f81-4402-9297-26f8ee2b894d">  

Payload: Data contained within a message


## Amazon SNS Topic: A channel for message to be delivered


## Monolithic applications and microservices
<img width="323" alt="5Y_ziM5e7aFJi9oW_sqlUJljjEBTJxbym" src="https://github.com/pranjal779/important-notes/assets/50409572/637e2bc7-64dc-40d8-86f2-8c4c84665b69">  

Applications are made of multiple components. The components communicate with each other to transmit data, fulfill requests, and keep the application running. 

Suppose that you have an application with tightly coupled components. These components might include databases, servers, the user interface, business logic, and so on. This type of architecture can be considered a monolithic application. 

In this approach to application architecture, if a single component fails, other components fail, and possibly the entire application fails.

To help maintain application availability when a single component fails, you can design your application through a microservices approach.

<img width="326" alt="b0Qm75gVIyDdL8wZ_oZ_ymliKJjdl2_No" src="https://github.com/pranjal779/important-notes/assets/50409572/6747d252-dfd8-4247-a222-3f0bf651a63f">

In a microservices approach, application components are loosely coupled. In this case, if a single component fails, the other components continue to work because they are communicating with each other. The loose coupling prevents the entire application from failing. 

When designing applications on AWS, you can take a microservices approach with services and components that fulfill different functions. Two services facilitate application integration: Amazon Simple Notification Service (Amazon SNS) and Amazon Simple Queue Service (Amazon SQS).

Amazon Simple Notification Service (Amazon SNS)

Amazon Simple Notification Service (Amazon SNS) is a publish/subscribe service. Using Amazon SNS topics, a publisher publishes messages to subscribers. This is similar to the coffee shop; the cashier provides coffee orders to the barista who makes the drinks.

In Amazon SNS, subscribers can be web servers, email addresses, AWS Lambda functions, or several other options. 

### 1 Publishing updates from a single topic
A single topic being published to subscribers.
<img width="440" alt="uybA7DATVA3_3QKC_y7QATr3rRUclpCbM" src="https://github.com/pranjal779/important-notes/assets/50409572/f194d32d-bfc9-499f-8276-2d8fcb7d4910">

Suppose that the coffee shop has a single newsletter that includes updates from all areas of its business. It includes topics such as coupons, coffee trivia, and new products. All of these topics are grouped because this is a single newsletter. All customers who subscribe to the newsletter receive updates about coupons, coffee trivia, and new products.

After a while, some customers express that they would prefer to receive separate newsletters for only the specific topics that interest them. The coffee shop owners decide to try this approach.


### 2 Publishing updates from multiple topics
<img width="440" alt="JwCw_Vb8Uaia_QTi_AQLsq9vSI_au1k59" src="https://github.com/pranjal779/important-notes/assets/50409572/cc612133-83c1-483c-aa4d-2fa2364ea3bd">

Now, instead of having a single newsletter for all topics, the coffee shop has broken it up into three separate newsletters. Each newsletter is devoted to a specific topic: coupons, coffee trivia, and new products.

Subscribers will now receive updates immediately for only the specific topics to which they have subscribed.

It is possible for subscribers to subscribe to a single topic or to multiple topics. For example, the first customer subscribes to only the coupons topic, and the second subscriber subscribes to only the coffee trivia topic. The third customer subscribes to both the coffee trivia and new products topics.

## Amazon Simple Queue Service (Amazon SQS)    

Amazon Simple Queue Service (Amazon SQS) is a message queuing service. 

Using Amazon SQS, you can send, store, and receive messages between software components, without losing messages or requiring other services to be available. In Amazon SQS, an application sends messages into a queue. A user or service retrieves a message from the queue, processes it, and then deletes it from the queue.

To review two examples of how to use Amazon SQS, choose the arrow buttons to display each one.

Step 1:
Example 1: Fulfilling an order
<img width="296" alt="Xb_d_zDsUziJs31U_bt0kbQ8Y503dkwiC" src="https://github.com/pranjal779/important-notes/assets/50409572/0c9b074c-8f34-4465-9ee1-7dc03fc4a4dd">

Suppose that the coffee shop has an ordering process in which a cashier takes orders, and a barista makes the orders. Think of the cashier and the barista as two separate components of an application. 

First, the cashier takes an order and writes it down on a piece of paper. Next, the cashier delivers the paper to the barista. Finally, the barista makes the drink and gives it to the customer.

When the next order comes in, the process repeats. This process runs smoothly as long as both the cashier and the barista are coordinated.

What might happen if the cashier took an order and went to deliver it to the barista, but the barista was out on a break or busy with another order? The cashier would need to wait until the barista is ready to accept the order. This would cause delays in the ordering process and require customers to wait longer to receive their orders.

As the coffee shop has become more popular and the ordering line is moving more slowly, the owners notice that the current ordering process is time consuming and inefficient. They decide to try a different approach that uses a queue.

Step 2:
Example 2: Orders in a queue  
<img width="296" alt="5Pboi5Qu6ksmOGSe_6mo5LiYqnvJeDSSa" src="https://github.com/pranjal779/important-notes/assets/50409572/ceca7549-79d8-4bcd-982c-6189982cdd21">



Which AWS service is the best choice for publishing messages to subscribers?

Amazon Simple Queue Service (Amazon SQS)

Correctly unselected
Amazon EC2 Auto Scaling

Correctly unselected
Amazon Simple Notification Service (Amazon SNS)

Correctly selected
Elastic Load Balancing

Correctly unselected
SUBMIT

Correct
The correct response option is Amazon Simple Notification Service (Amazon SNS).

 

Amazon SNS is a publish/subscribe service. Using Amazon SNS topics, a publisher publishes messages to subscribers.

 

The other response options are incorrect because:

 

Amazon Simple Queue Service (Amazon SQS) is a message queuing service. It does not use the message subscription and topic model that is involved with Amazon SNS.
Amazon EC2 Auto Scaling enables you to automatically add or remove Amazon EC2 instances in response to changing application demand.
Elastic Load Balancing is the AWS service that automatically distributes incoming application traffic across multiple resources, such as Amazon EC2 instances.
Learn more:

[Amazon SNS](https://aws.amazon.com/sns)
