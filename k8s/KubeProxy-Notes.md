# What is kube-proxy? (Clear & simple explanation)

**kube-proxy** is a network component that runs on every node in a Kubernetes cluster.
Its main job is to make Service → Pod communication work.

## What kube-proxy actually does

- ✔ Maintains the list of all Services and their backend Pods
- ✔ Uses iptables or IPVS rules to route traffic to the right Pod
- ✔ Provides load balancing between Pods
- ✔ Handles ClusterIP, NodePort, and LoadBalancer types of Services

## Think of it like this:

A Service in Kubernetes is like a virtual IP.  
But a virtual IP alone does nothing.  
kube-proxy is the traffic controller that makes sure traffic to the Service goes to the correct Pods.  

## Without kube-proxy:

- Services wouldn’t work
- NodePorts wouldn’t work
- LoadBalancer services wouldn’t reach Pods
- No internal load balancing
- Kubernetes networking would basically break.
