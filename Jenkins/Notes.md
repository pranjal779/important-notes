In Jenkins, a node refers to a machine that is part of the Jenkins environment and is used to execute build tasks. Nodes can be categorized into two types: the built-in node and agent nodes.

Built-in Node

The built-in node is part of the Jenkins controller itself. It is possible to run tasks on this node, but it is generally discouraged due to security, performance, and scalability concerns. The number of executors configured for the built-in node determines its ability to run tasks. Setting the number of executors to 0 disables running tasks on the built-in node.

Agent Nodes

Agent nodes are separate machines that connect to the Jenkins controller and execute build tasks. These nodes can run on any operating system that supports Java. Agents manage task execution using executors, which are essentially threads that run tasks. The number of executors on a node defines the number of concurrent tasks that can run.

Creating an Agent Node

To create an agent node in Jenkins, follow these steps:

Go to Jenkins Dashboard: Navigate to the Jenkins dashboard and select "Manage Jenkins" from the main menu.

Manage Nodes and Clouds: Click on "Manage Nodes and Clouds" and then select "New Node" from the side menu.

Fill in Node Details: Provide a name for the node and select the type (e.g., Permanent Agent). Fill in other details such as the number of executors, remote root directory, and labels.

Launch Method: Choose the launch method for the agent. For example, you can select "Launch agent by connecting it to the controller" and then follow the instructions to start the agent on the node.

Go to Jenkins Dashboard: Navigate to the Jenkins dashboard and select "Manage Jenkins" from the main menu.

Manage Nodes and Clouds: Click on "Manage Nodes and Clouds" and then select "New Node" from the side menu.

Fill in Node Details: Provide a name for the node and select the type (e.g., Permanent Agent). Fill in other details such as the number of executors, remote root directory, and labels.

Launch Method: Choose the launch method for the agent. For example, you can select "Launch agent by connecting it to the controller" and then follow the instructions to start the agent on the node
2
.

Running Jenkins Agent as a Service

To ensure that the Jenkins agent runs continuously, you can set it up as a service. Here is an example of how to do this on a Linux system using systemd:

Create a Directory: Create a directory for the Jenkins agent, e.g., /usr/local/jenkins-service.

Move agent.jar: Move the agent.jar file to this directory.

Create start-agent.sh: Create a script named start-agent.sh with the following content:

#!/bin/bash
cd /usr/local/jenkins-service
curl -sO http://<controller_ip>:8080/jnlpJars/agent.jar
java -jar agent.jar -jnlpUrl http://<controller_ip>:8080/computer/<node_name>/jenkins-agent.jnlp -secret <secret> -workDir "/home/jenkins"
exit 0
Make Script Executable: Make the script executable by running chmod +x start-agent.sh.

Create Systemd Service: Create a systemd service file at /etc/systemd/system/jenkins-agent.service with the following content:

[Unit]
Description=Jenkins Agent

[Service]
User=jenkins
WorkingDirectory=/home/jenkins
ExecStart=/bin/bash /usr/local/jenkins-service/start-agent.sh
Restart=always

[Install]
WantedBy=multi-user.target
Enable and Start Service: Enable the service with sudo systemctl enable jenkins-agent.service and start it with sudo systemctl start jenkins-agent.service
2
.

By following these steps, you can effectively manage and run Jenkins nodes and agents, ensuring a robust and scalable CI/CD environment.
