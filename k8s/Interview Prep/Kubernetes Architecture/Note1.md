Pranjal, first of all, your understanding is not bad. You have remembered several important components correctly, including their names and broad responsibilities. The main thing you need now is to connect those components into a single working mental model.

And I like your approach: you're trying to recall what you learned without looking at your notes. That's a useful way to discover what you understand and where you need to improve.

Let's study this as if we're preparing for a Kubernetes interview and building the foundation for your DevOps career.

# Kubernetes Architecture: Control Plane and Worker Nodes

![How Kubernetes Clusters Work: A Production-Focused Deep Dive](https://images.openai.com/static-rsc-4/1ADukZG1Vjw9OXT92SMS2Y_3Oi94ovX0UNiC0nr2RBfG4iHPs4nrTstiVN75WUWXn5V9xiPiuZy5-l3m-bu-sw_zINBIXIe1BABgB1r-f52pyYMK8n80xa5MVFwipxUQjzrgIYgC9soA3wuCVsxS82d9eVphrB2dmGr2h-eF31s?purpose=inline)

Conceptual view: the control plane manages the cluster, while worker nodes run application workloads.

## 1. First, understand the big picture

A Kubernetes cluster consists of two major architectural parts:

1. Control plane (previously commonly called the Master)

2. Worker nodes

The control plane manages the overall state of the cluster and makes decisions about workloads. Worker nodes provide the environment where your application Pods run.

A cluster typically has one or more worker nodes, and production environments commonly use multiple control-plane and worker machines for availability. The exact deployment architecture can vary depending on the cluster setup.

![Kubernetes +1](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

Think of it like running a large company:
<img width="1222" height="532" alt="image" src="https://github.com/user-attachments/assets/30cd6aba-cd30-4581-b1cf-2274ba53d216" />


#### Control Plane

The management and decision-making part of the cluster.

Decides what should happen and coordinates the cluster.

![Kondycja polskiego przemysłu w 2025 roku. Analiza rynku, wyzwania i trendy - eGospodarka.pl - Raporty i prognozy](https://images.openai.com/static-rsc-4/cPkQxdUbqI2_qx8iPrO2gh6X4s6_JPsrSJnL-YQv6oXvC79HtA4vU2Jxx6FK4HHc47k4dnFmJQBK7X0pUwb8UU-jUoNvcwSg2jOswlQDdZZGZdL5qEwqXZBEndvWHjT80Bo3Ek2iVmoMxj5yO9BXCoNoxhroA018txAddcMMqTY?purpose=inline)

#### Worker Nodes

The machines where the actual application work is performed.

Run and maintain the containers that make up your Pods.

This analogy is only a starting point. Unlike a human organization, Kubernetes uses automated control loops, APIs, and agents to manage the system.

# Part 1: Control Plane (Master)

The control plane contains the components responsible for managing Kubernetes.

Your video lists these components:

|Component|Main responsibility|
| --- | --- |
|kube-apiserver|Exposes the Kubernetes API|
|kube-scheduler|Selects suitable nodes for unscheduled Pods|
|etcd|Stores Kubernetes cluster data|
|kube-controller-manager|Runs built-in control loops|
|cloud-controller-manager|Integrates Kubernetes with cloud-provider-specific functionality|

These are the core components described in the official Kubernetes documentation. The cloud controller manager is optional. ![Kubernetes +1](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

Let's understand each one in depth.

## 2. kube-apiserver — The communication gateway

### What you said

> API Server connects all the dots within and outside the application, it lets each and every component talk with each other, through it.

Your understanding is directionally correct. You correctly recognized that the API server is central to communication within Kubernetes.

However, let's make the explanation more precise.

### What is kube-apiserver?

The kube-apiserver is the component of the Kubernetes control plane that exposes the Kubernetes API. It acts as the main entry point for Kubernetes API requests.

Users, administrators, control-plane components, and other authorized clients interact with the Kubernetes API through the API server. Nodes also use it to communicate with the control plane. ![Kubernetes +1](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### Example: You create a Pod

Suppose you create a manifest:

YAML

```
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
spec:
  containers:
    - name: nginx
      image: nginx
```

Then you run:

Bash

```
kubectl apply -f pod.yaml
```

What happens conceptually?

1. You use kubectl

   You send a request to the Kubernetes API.

2. The API server receives the request

   It processes the request, including relevant authentication, authorization, and validation.

3. The Pod object is persisted

   Kubernetes stores the relevant cluster state in etcd.

4. Other components react

   The scheduler can select a node for an unscheduled Pod, and the appropriate kubelet can work toward running it.

This is a simplified sequence. The API server does not itself run the container or select the worker node. ![Kubernetes +1](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### Important correction

You said:

> It lets each and every component talk with each other, through it.

A more accurate explanation is:

> The kube-apiserver provides the central Kubernetes API through which clients and control-plane components interact with Kubernetes resources. Nodes primarily communicate with the control plane through the API server, while some interactions involve direct API-server-to-kubelet communication.

Kubernetes follows a hub-and-spoke API pattern. This means you should not imagine every component making arbitrary direct connections to every other component. ![Kubernetes](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### Interview-ready answer

> The kube-apiserver is the central component of the Kubernetes control plane that exposes the Kubernetes API. It receives requests from users, cluster components, and other authorized clients, processes those requests, and serves as the main communication interface for managing Kubernetes resources and cluster state.

Remember: API server = Kubernetes API gateway.

# 3. kube-scheduler — Decides where Pods should run

### What you said

> Scheduler, it schedules all the pods where they go, it lets/manage faulty pods go to other container, so that the faulty pod does affect the overall performance or quality of its environment runtime.

You have the first part correct. The second part needs an important correction.

### What is the kube-scheduler?

The kube-scheduler is responsible for selecting a suitable node for a Pod that has not yet been assigned to a node.

It considers factors such as resource requirements, constraints, affinity and anti-affinity rules, and other scheduling considerations. ![Kubernetes +1](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### What does the scheduler actually do?

Imagine that you have three worker nodes:

<img width="1097" height="445" alt="image" src="https://github.com/user-attachments/assets/ff9718c7-bb32-4815-a2e2-379f0103aa24" />

The diagram is conceptual. The scheduler evaluates the cluster's scheduling requirements and selects an appropriate node; it does not simply select the least-used node in every situation.

### What happens if a Pod fails?

This is where your understanding needs to be separated into two different responsibilities.

The scheduler is not responsible for detecting and moving every faulty Pod.

Consider a Pod that is running on Worker Node 1.

If the Pod's container crashes, the kubelet and container runtime may work together to restart the container according to the Pod's configuration.

If a Pod is managed by a Deployment and needs replacement, Kubernetes controllers help ensure the desired number of replicas is maintained. A replacement Pod that has not been assigned to a node can then be scheduled. If a node becomes unavailable, other controllers and workload mechanisms may be involved in responding to that failure. ![Kubernetes +1](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### Key distinction

|Component|Responsibility|
| --- | --- |
|kube-scheduler|Selects a node for an unscheduled Pod|
|kubelet|Ensures the containers described by assigned PodSpecs are running|
|Controllers|Reconcile desired and current states, including workload and node-related behavior|
|Container runtime|Runs and manages containers|

The scheduler's job is placement, not general-purpose application health management. ![Kubernetes +1](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### Interview-ready answer

> The kube-scheduler is a Kubernetes control-plane component that watches for newly created Pods that have not been assigned to a node. It evaluates scheduling requirements, such as resource availability and placement constraints, and selects a suitable worker node for the Pod.

Remember: Scheduler = Where should this Pod run?

# 4. etcd — The cluster's key-value data store

### What you said

> ETCD, the database, specifically a key-value pair database which stores the state of the cluster.

This is correct. You have the fundamental concept.

Let's make your explanation more detailed.

### What is etcd?

etcd is a consistent and highly available key-value store used as the backing store for Kubernetes cluster data.

Kubernetes uses it to persist information associated with its API resources and cluster state. ![Kubernetes +1](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### What is a key-value database?

A key-value store organizes data as pairs:

| Key | Value |
| --- | --- |
|`app/config`|Application configuration|
|`cluster/resource/...`|Stored resource data|
|`pod/...`|Pod-related resource data|

These are illustrative examples, not an exact representation of every key used in a particular Kubernetes version.

The important idea is:

A key identifies stored data, and the value contains the associated information.

### Why is etcd important?

Suppose you create a Deployment:

YAML

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx
```

You are declaring that you want three replicas.

Kubernetes stores resource information through its API and etcd is the backing store for cluster data. Controllers then observe the relevant resources and work toward the desired state. ![Kubernetes +1](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### A crucial distinction

Do not think of etcd as the place where the running containers themselves are stored.

* The container image is stored in an image registry or local image cache.
* The container runs on a worker node.
* etcd stores Kubernetes cluster data, including the objects that describe the desired and observed state.

### Interview-ready answer

> etcd is a consistent and highly available key-value store used by Kubernetes as its backing store for cluster data. It stores the information associated with Kubernetes resources and plays an important role in preserving cluster state. Kubernetes control-plane components interact with this data through the Kubernetes API.

Remember: etcd = Persistent cluster data.

# 5. kube-controller-manager — The reconciliation engine

This is probably the most important component to understand conceptually, because it connects directly to Kubernetes' self-healing and declarative nature.

### What you said

> Controller, this controls all actual and desired state of the cluster and per the requirements.

You are close, but there are two important refinements:

1. The kube-controller-manager runs multiple controllers.

2. Controllers continuously work to bring the current state closer to the desired state. They do not simply control every aspect of Kubernetes through one universal controller.

### What is a controller?

A controller is a control loop.

It watches relevant Kubernetes resources and takes action when the observed state differs from the desired state.

The official Kubernetes documentation uses a thermostat as an analogy:

* Desired state: You want the room to be 22°C.
* Current state: The room is 18°C.
* Controller: Takes action to move the room toward 22°C.

Kubernetes uses the same general reconciliation idea. ![Kubernetes](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### Example: Deployment with three replicas

You create:

YAML

```
spec:
  replicas: 3
```

Your desired state:

```
Desired number of replicas = 3
```

Suppose your cluster currently has:

```
Running replicas = 2
```

The relevant controller observes the difference and works toward restoring the desired state. It does not run the container directly; it uses Kubernetes resources and API interactions to make the necessary changes. ![Kubernetes](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

<img width="1005" height="527" alt="image" src="https://github.com/user-attachments/assets/3309aa6b-61f1-46d7-97cf-8757fc04c0f0" />

Desired State

## 3 replicas

Observed State

## 2 replicas

Controller reconciles

Works through Kubernetes API operations to move the system toward the desired state.

Target State

## 3 replicas

This is a simplified example of the reconciliation process. Actual behavior depends on the workload, controller, and cluster conditions.

### What is inside kube-controller-manager?

The kube-controller-manager runs several built-in controllers. Examples include:

|Controller|What it does|
| --- | --- |
|Node controller|Responds to node-related failures and changes|
|Job controller|Manages Pods for Jobs and their completion|
|EndpointSlice controller|Maintains EndpointSlice information associated with Services and Pods|
|ServiceAccount controller|Handles ServiceAccount-related behavior|

These are examples, not a complete list. ![Kubernetes](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### Important distinction: kube-controller-manager vs controllers

You should say:

> The kube-controller-manager runs multiple built-in controllers, each responsible for a specific aspect of Kubernetes behavior.

Do not say:

> The controller manages everything in Kubernetes.

That explanation is too broad and hides how the architecture actually works.

### Interview-ready answer

> The kube-controller-manager is a control-plane component that runs multiple controllers. These controllers continuously observe Kubernetes resources and reconcile the current state with the desired state. For example, workload controllers can help maintain the desired number of application replicas, while the node controller responds to node-related events.

Remember: Controller = Is the current state moving toward the desired state?

# 6. cloud-controller-manager — Cloud integration

This is where your original understanding needs the biggest correction.

### What you said

> Suppose someone created a new cloud called X, now they have freedom to create their own logic from CNCF to make a new cloud based on this controller manager and make the cloud in their image.

You are recognizing that cloud controller manager allows cloud-specific logic. That's a good starting point.

However, it is not primarily a mechanism for creating a new cloud.

### What is cloud-controller-manager?

The cloud-controller-manager is a Kubernetes control-plane component that contains cloud-provider-specific control logic. It allows Kubernetes to integrate with a cloud provider's APIs while separating cloud-specific functionality from the core Kubernetes control plane. ![Kubernetes](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

Think of it as an integration layer.

Your Kubernetes cluster runs in a cloud environment such as AWS, Azure, or Google Cloud. Some operations require interaction with the cloud provider's infrastructure.

For example:

* Checking cloud-specific node information.
* Configuring routes where supported.
* Creating or updating cloud load balancers through supported integrations.

These are examples of cloud-dependent controller responsibilities. ![Kubernetes](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)



### Example: Kubernetes Service of type LoadBalancer

Suppose you create a Service:

YAML

```
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  type: LoadBalancer
  selector:
    app: my-app
  ports:
    - port: 80
      targetPort: 8080
```

In a supported cloud integration, the cloud-specific controller may interact with the cloud provider to provision or manage a load balancer.

The exact implementation depends on your cloud provider, integration, and cluster configuration.

### How to understand it

Imagine:

```
Kubernetes
    |
    | Cloud-specific integration
    v
Cloud Provider API
    |
    v
Cloud Infrastructure
```

The cloud controller manager does not create a new cloud platform. Instead, it helps Kubernetes interact with infrastructure services provided by a cloud platform.

Note: The cloud-controller-manager is optional. It is not required for every Kubernetes deployment, such as a cluster running on your own machines without cloud-provider integration.

![Kubernetes](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### Interview-ready answer

> The cloud-controller-manager is an optional Kubernetes control-plane component that integrates Kubernetes with cloud-provider-specific APIs. It runs cloud-dependent controllers, such as those involved in node information, routes, or load balancers, depending on the cloud integration. Its purpose is to support cloud infrastructure operations, not to create a new cloud platform.

Remember: Cloud controller manager = Kubernetes ↔ Cloud provider integration.

# Part 2: Worker Node

Now let's move to the second major part of the architecture.

Your worker node understanding is fairly good, but we need to correct the responsibilities of kubelet and kube-proxy.

## Worker node components

A typical Kubernetes worker node includes:

|Component|Main responsibility|
| --- | --- |
|kubelet|Ensures assigned Pod containers are running|
|kube-proxy|Implements part of the Kubernetes Service networking behavior|
|Container runtime|Runs and manages containers|

The official documentation identifies these as node components. kube-proxy is optional when another network implementation provides equivalent Service proxying functionality. ![Kubernetes +1](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

# 7. kubelet — The agent running on each node

### What you said

> Kubelet: this can create a finite number of pods, or manages the pods to the desired and actual state and manages if they are healthy or not.

You have correctly identified that kubelet manages the running state of containers in Pods. However, the number of Pods is not the best way to define its role.

### What is kubelet?

The kubelet is an agent that runs on each node and ensures that the containers described in assigned PodSpecs are running and healthy according to the relevant configuration.

It receives Pod specifications through various mechanisms and works with the container runtime to maintain the Pod's containers. It does not manage containers that were not created by Kubernetes.

![Kubernetes](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### Let's understand with an example

Suppose the scheduler assigns your Pod to Worker Node 1.

```
Control Plane
     |
     | Pod assigned to Worker Node 1
     v
Worker Node 1
     |
     v
kubelet
     |
     v
Container Runtime
     |
     v
Running Container
```

The kubelet is responsible for making sure the containers described in the PodSpec are running on that node.

It communicates with the container runtime to carry out the required container operations. The runtime is the software responsible for executing the containers. ![Kubernetes](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### Does kubelet decide where Pods go?

No.

The kube-scheduler selects a suitable node for an unscheduled Pod. The kubelet on that selected node is then responsible for making sure the Pod's containers are running. ![Kubernetes](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### Does kubelet create any number of Pods?

Not exactly.

Kubelet works with the Pod specifications assigned to its node. It does not independently decide how many replicas of an application the cluster should have. Workload controllers and other control-plane components handle the broader desired-state management.

### Interview-ready answer

> The kubelet is an agent that runs on every Kubernetes node. It receives Pod specifications through supported mechanisms and ensures that the containers described in those specifications are running and healthy. It works with the container runtime to manage the containers belonging to Kubernetes Pods.

Remember: kubelet = Agent that makes assigned Pods run on the node.

# 8. kube-proxy — Service networking

### What you said

> kube-proxy: this manages internal and external traffic in your cluster or the application like a traffic master.

You have the traffic-related concept, but your description is too broad.

### What is kube-proxy?

kube-proxy is a network proxy component that implements part of the Kubernetes Service concept.
It maintains network rules on nodes that allow traffic to reach Pods through Kubernetes Services. Depending on the implementation and configuration, it uses the operating system's packet-filtering functionality or forwards traffic itself. ![Kubernetes](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### Example: Service routes traffic to Pods

Suppose you have:

```
Service: backend-service
        |
        |
        +------> Pod 1
        |
        +------> Pod 2
        |
        +------> Pod 3
```

A Service provides a stable networking abstraction for reaching a group of backend Pods.

kube-proxy maintains node-level networking rules that help implement Service behavior, including routing traffic to appropriate Pod endpoints.

### What kube-proxy is NOT

It is not a general-purpose manager of all internal and external traffic.

For example, Ingress controllers, cloud load balancers, network plugins, and other networking components may perform additional functions. kube-proxy's specific responsibility is tied to implementing Kubernetes Service networking behavior.

![Kubernetes +1](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### Is kube-proxy always required?

Not necessarily.
The official Kubernetes documentation states that kube-proxy is optional when a network plugin provides an equivalent implementation of Service proxying. ![Kubernetes](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### Interview-ready answer

> kube-proxy is a network component that runs on Kubernetes nodes and implements part of the Kubernetes Service concept. It maintains network rules that allow traffic to reach Pods through Services. Its implementation can use operating-system packet filtering or other forwarding mechanisms, and some network plugins provide equivalent functionality without kube-proxy.

Remember: kube-proxy = Implements Service traffic routing behavior.

# 9. Container runtime — Runs the containers

### What you said

> Container runtime: Kubernetes pulls the image or requirements from the hub, like Docker Hub and acts like an engine and run the application.

This is a good beginner-level description of the general workflow. Let's make it technically accurate.

### What is a container runtime?

A container runtime is the software responsible for running and managing containers in Kubernetes.

Kubernetes supports container runtimes such as:

* containerd
* CRI-O
* Other implementations that support the Kubernetes Container Runtime Interface (CRI)

The runtime is responsible for the execution and lifecycle of containers.

![Kubernetes](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### Example: You specify an image

In your Pod manifest:

YAML

```
spec:
  containers:
    - name: nginx
      image: nginx:latest
```

The kubelet works with the container runtime to ensure the container is running.
If the required image is not available locally, the runtime can pull it from a configured container image registry, subject to its configuration and access requirements.
Important: Kubernetes does not require Docker Engine as its container runtime. The runtime can be containerd, CRI-O, or another compatible implementation. ![Kubernetes](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### Interview-ready answer

> A container runtime is the software responsible for running and managing containers on Kubernetes nodes. The kubelet communicates with the runtime to ensure that the containers specified in Pods are running. Examples of container runtimes include containerd and CRI-O.

Remember: Container runtime = Executes and manages containers.

# Part 3: Understand the complete architecture
Now let's combine everything.
This is the most important part of your learning. You should be able to explain how the components work together, not just memorize their definitions.

## Example: Deploying an NGINX application
Imagine that you are a DevOps engineer.
You want to deploy NGINX with three replicas on a Kubernetes cluster.
You create a Deployment manifest and run:

Bash

```
kubectl apply -f nginx-deployment.yaml
```

What happens?

<img width="930" height="966" alt="image" src="https://github.com/user-attachments/assets/8afb7001-5d5e-40ad-9139-de6070f2f777" />

#### 1. User / kubectl
Sends the Deployment request

#### 2. kube-apiserver
Processes the API request and makes the resource available to the cluster.

#### 3. etcd
Persists Kubernetes cluster data.

#### 4. Controllers
Work toward the Deployment's desired replica state.

#### 5. kube-scheduler
Selects suitable worker nodes for unscheduled Pods.

#### 6. kubelet
Works with the runtime to ensure assigned Pods are running.

#### 7. Container runtime
Runs the application containers.
This is a simplified learning flow. In practice, controllers and components continuously interact through the API server, and the kubelet reports node and Pod-related information to Kubernetes. The scheduler and controllers do not simply execute once and stop; they operate as part of the cluster's ongoing control processes. ![Kubernetes +2](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

# Part 4: A real-life example you should practice

Let's imagine you have built a small application using:

* Frontend: React
* Backend: Python Flask
* Database: PostgreSQL

You want to deploy this application to Kubernetes.

You have:

```
Frontend Pods
Backend Pods
Database Pod(s)
```

Now imagine that you create a Deployment for the backend with three replicas.

### Scenario A: A new Deployment is created
The API server accepts the request. Kubernetes persists the relevant data and controllers work toward the desired state. The scheduler selects nodes for the Pods that need placement, and kubelets on those nodes work with the container runtime to run them. ![Kubernetes +1](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### Scenario B: One backend container crashes
The kubelet and container runtime may restart the container according to its configuration. If the workload needs a replacement Pod, the relevant workload controllers may take action to restore the desired state.

The scheduler is not automatically responsible for every container restart. ![Kubernetes +1](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### Scenario C: A worker node becomes unavailable
Kubernetes has node-related controllers and workload mechanisms that help detect and respond to node failures. Depending on the workload and circumstances, replacement Pods may need to be scheduled onto other suitable nodes. The exact behavior depends on the controller and failure conditions. ![Kubernetes +1](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

### Scenario D: Users access the backend through a Service
A Kubernetes Service provides a stable networking abstraction for reaching Pods. kube-proxy, where used, helps implement Service networking through node-level network rules. An Ingress controller or cloud load balancer can provide additional external routing functionality. ![Kubernetes +1](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32)

This is how you should think about Kubernetes: multiple components, each with a defined responsibility, working together to keep the cluster operating toward its desired state.

# Part 5: Important concepts you should memorize
Here is the condensed version I would want you to understand before moving deeper into your KodeKloud Kubernetes course.

<img width="1050" height="1087" alt="image" src="https://github.com/user-attachments/assets/26e00093-8561-4622-85d9-1be0dae12cb8" />

#### kube-apiserver
The API gateway and central interface for Kubernetes API interactions.

#### kube-scheduler
Selects suitable nodes for unscheduled Pods.

#### etcd
The consistent key-value backing store for Kubernetes cluster data.

#### kube-controller-manager
Runs controllers that reconcile desired and current state.

#### cloud-controller-manager
Handles cloud-provider-specific integration logic where configured.

#### kubelet
Ensures the containers described in assigned PodSpecs are running on the node.

#### kube-proxy
Implements part of Kubernetes Service networking using node-level network rules.

#### Container runtime
Executes and manages containers on the node.

# Part 6: The most important correction for your understanding

You are currently learning several components individually. That's good, but I want you to avoid one common beginner mistake.

### Don't think of Kubernetes like this:

> API server does everything. Scheduler moves Pods. Kubelet creates Pods. Controller fixes all problems.

That's too simplistic.

### Think of it like this:

Kubernetes is a collection of specialized components that cooperate through the Kubernetes API and control loops.

Each component has a responsibility:

* API server: Provides the API interface.
* etcd: Persists cluster data.
* Controllers: Reconcile desired and current states.
* Scheduler: Assigns unscheduled Pods to suitable nodes.
* Kubelet: Ensures assigned Pod containers run on its node.
* Runtime: Executes containers.
* kube-proxy: Implements part of Service networking.

This is a much stronger architectural understanding. ![Kubernetes +1](https://www.google.com/s2/favicons?domain=https://kubernetes.io\&sz=32) 

# Part 7: Your LinkedIn assignment — What should you do?

You mentioned that you don't feel it's necessary to post the assignment on LinkedIn right now. That's perfectly reasonable.

You can use the assignment as an interview-preparation exercise instead. You don't need to publish every learning activity to prove that you're progressing.

I'd suggest this workflow:

1. Learn the architecture

   Understand the responsibility of every component and how they interact.

2. Write your own explanation

   Try to explain the control plane and worker node without looking at your notes.

3. Compare and correct

   Review your explanation against the official documentation and fix inaccuracies.

4. Practice interview questions

   Explain what happens when you create a Pod, when a container crashes, or when a worker node fails.

5. Optionally publish

   If you want to share your progress on LinkedIn, create a concise post after you understand the topic.

For your current stage, the understanding and practice are more important than whether you publish the assignment.

# Part 8: Practice the architecture yourself

Now let's test your understanding. Don't look at the explanations above when answering if you can help it.

## Architecture practice

6 questions

Write your answers in your own words. You can then send them to me for correction.

#### 1. What happens when you run kubectl apply -f deployment.yaml?

Explain the main components involved, from the API request to the application containers running.

Kubernetes API receives the requests to create the desired state from the deployment instruction, the API service than make the resources available to the cluster, the ETCD saves the requirements of the desired state in a key-value pair, and the API service tries to maintain it, the controller takes the state to the desired state, kube-scheduler then select the suitable worker nodes for scheduled pods, kubelet works with the runtime and makes sures the pods are running and Container Runtime runs the application

#### 2. What is the responsibility of kube-scheduler?

Focus on Pod placement. What does it do, and what does it not do?

the scheduler evalutes the cluster's scheduling requirements and selects an appropirate node; it considers factors such as resource requirements, constraints, affinity and anti-affinity rules, and other scheduling considerations

#### 3. What is the difference between kubelet and container runtime?

Explain the relationship between the agent and the software that executes containers.

The kubelet is an agent that runs on each node and ensures that the containers described in assigned PodSpecs are running and healthy according to the relevant configuration, it reveives Pod specifications through various through various mechanisms and works with the container runtime to maintain the Pod's containers. It does not manage contianers that were not created by kubernetes, A container runtime is the software responsible for running and managing containers in Kubernetes. Kubernetes supports container runtimes such as: containerd CRI-O Other implementations that support the Kubernetes Container Runtime Interface (CRI), The runtime is responsible for the execution and lifecycle of containers The kubelet works with the container runtime to ensure the container is running. If the required image is not available locally, the runtime can pull it from a configured container image registry, subject to its configuration and access requirements.

#### 4. A Deployment wants 3 replicas, but only 2 are running. Which component or mechanism works toward fixing this?

Think about desired state, controllers, and the role of the scheduler.

the desired state is 3 replicas and the current state is 2, so the controller observes the difference and works towards restoring to the desired state. it does not run the container directly, it uses kubernetes resources and API interaction to make the necessary changes

#### 5. What is the responsibility of kube-proxy?

Focus on Kubernetes Services and node-level network rules.

kube-proxy is a network proxy component that implements part of the Kubernetes Service concept. It maintains network rules on nodes that allow traffic to reach Pods through Kubernetes Services. Depending on the implementation and configuration, it uses the operating system's packet-filtering functionality or forwards traffic itself.

#### 6. Why does Kubernetes use etcd?

What type of database is it, and what kind of information does it store?

etcd is a consistent and highly available key-value store used as the backing store for Kubernetes cluster data. Kubernetes uses it to persist information associated with its API resources and cluster state.

Send my answers for review

# Part 9: How to explain it in an interview

Here is a long answer you can practice speaking aloud. It is written to be technically accurate without making it unnecessarily complicated.

Kubernetes Architecture — Control Plane and Worker Nodes

## Kubernetes Architecture — Control Plane and Worker Nodes

Kubernetes follows a cluster-based architecture consisting of a control plane and one or more worker nodes. The control plane is responsible for managing the overall state of the cluster, making scheduling decisions, and coordinating the Kubernetes resources. Worker nodes provide the environment where application Pods and their containers run.

The main components of the control plane are the kube-apiserver, etcd, kube-scheduler, kube-controller-manager, and optionally the cloud-controller-manager.

The kube-apiserver is the central interface to the Kubernetes API. It receives requests from users, cluster components, and authorized clients and acts as the main communication interface for managing Kubernetes resources.

etcd is a consistent and highly available key-value store used as the backing store for Kubernetes cluster data. It stores information associated with Kubernetes resources and is an important part of the control plane's persistent data storage.

The kube-scheduler is responsible for selecting a suitable worker node for Pods that have not yet been assigned to a node. It evaluates scheduling requirements, including resource availability and placement constraints.

The kube-controller-manager runs multiple controllers. These controllers continuously observe Kubernetes resources and work to reconcile the current state with the desired state. For example, workload controllers can help maintain the desired number of replicas for an application.

The cloud-controller-manager is an optional component that integrates Kubernetes with cloud-provider-specific APIs. It supports cloud-related operations, such as managing cloud load balancers or other provider-dependent functionality, depending on the integration.

Worker nodes contain the kubelet, kube-proxy where used, and a container runtime. The kubelet is an agent that ensures containers described in assigned Pod specifications are running and healthy. It works with the container runtime to manage the execution of containers.

The container runtime is the software responsible for running and managing containers, such as containerd or CRI-O. kube-proxy implements part of the Kubernetes Service concept by maintaining network rules that allow traffic to reach Pods through Services.

Together, the control plane and worker nodes form a Kubernetes cluster. The control plane manages the desired state and cluster coordination, while the worker nodes execute the application workloads. These components work together through the Kubernetes API and control loops to maintain the cluster's operation.

Practice tip: Don't try to memorize the entire paragraph word for word. Understand the concepts and explain them in your own words. If you can explain the architecture clearly, you are making real progress.

# Part 10: Your English and grammar corrections

You asked for grammar feedback in our earlier conversation, so I'll include a few corrections from the message you just wrote.

### Original

> I can tell you what I understand (and I learned, well I dont know how much i got it down in my brain)

### Improved

> I can tell you what I understand and what I have learned, although I'm not sure how much of it I've retained.

What changed?

| Your wording | Improved wording | Why |
| --- | --- | --- |
|`dont`|`don't`|Missing apostrophe|
|`i`|`I`|The pronoun "I" is always capitalized|
|`got it down in my brain`|`retained`|More natural and professional phrasing|
|`what I understand (and I learned`|`what I understand and what I have learned`|Clearer sentence structure|

### Original

> I know this is pretty bad of explaination, but teach me

### Improved

> I know this explanation is not very detailed, but please help me understand the concepts.

What changed?

* `explaination` → explanation (correct spelling)

* `pretty bad of explanation` → not very detailed (more natural English)

* `teach me` → please help me understand the concepts (clearer and more specific)

Your English does not need to be perfect before you start learning DevOps. Keep writing and speaking. We'll improve both your technical understanding and communication as we go.

## My recommendation for your next step

You have just learned the broad architecture. Don't rush into memorizing every advanced Kubernetes component yet.

I'd suggest focusing on this sequence:

Control plane vs Worker node

Understand the roles and boundaries.

Pod lifecycle

How a Pod is created, scheduled, and run.

Deployment and ReplicaSet

How desired replica state is maintained.

Services and Networking

How applications communicate with each other.

Ingress

How HTTP/HTTPS requests can reach applications.

One last thing, Pranjal: you don't need to feel bad about forgetting or confusing concepts. Your job right now is to build a reliable foundation, not to sound like someone who has worked with Kubernetes for ten years. Keep testing yourself, keep asking questions, and keep correcting your understanding.

We're going to take this one component at a time. 🤝
