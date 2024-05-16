Terraform Core
Terraform Plugins


output format is
resourceName.localName.attributeName


-------------
# Iterators
you can specify a specific Terraform configuration file to plan by providing the file name directly after the terraform plan command. Here's the syntax:

```bash
terraform plan -var-file=<file_name>.tfvars
```
Replace <file_name>.tfvars with the name of the Terraform configuration file you want to use for planning. This command will instruct Terraform to only process the specified configuration file for planning.

Additionally, if you want to specify a .tf file instead of a .tfvars file, you can simply provide the file name without any additional flags:

```bash
terraform plan <file_name>.tf
```
This command will plan the Terraform configuration defined in the specified .tf file.

By using these commands, you can isolate testing to specific Terraform configuration files without processing all files in alphabetical order.
--------------

In your Terraform configuration, you're using the `dynamic` block to create multiple ingress and egress rules for an AWS security group based on the values provided in the `sg_ports` variable. Let's break down how this works:

1. **Variable Definition:**
   ```hcl
   variable "sg_ports" {
     type        = list(number)
     description = "list of ingress ports"
     default     = [8200, 8201, 8300, 9200, 9500]
   }
   ```
   Here, you've defined a variable named `sg_ports` which is a list of numbers representing the ingress ports. You've also provided a default value for this variable, which includes a list of port numbers `[8200, 8201, 8300, 9200, 9500]`.

2. **Dynamic Ingress Rule Creation:**
   ```hcl
   dynamic "ingress" {
     for_each = var.sg_ports
     iterator = port
     content {
       from_port   = port.value
       to_port     = port.value
       protocol    = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
     }
   }
   ```
   - The `dynamic` block is used to dynamically create ingress rules based on the elements of the `sg_ports` list.
   - The `for_each` argument iterates over each element of the `sg_ports` list. For each iteration, Terraform creates an instance of the `ingress` block.
   - The `iterator` argument specifies a variable name (`port`) to represent the current element of the iteration.
   - Inside the `content` block, `port.value` is used to access the value of the current iteration, representing the ingress port.
   - In this example, each ingress rule will have the same `from_port` and `to_port`, which are set to the value of the current iteration.

3. **Dynamic Egress Rule Creation:**
   ```hcl
   dynamic "egress" {
     for_each = var.sg_ports
     content {
       from_port   = egress.value
       to_port     = egress.value
       protocol    = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
     }
   }
   ```
   - Similarly, the `dynamic` block for egress rules iterates over each element of the `sg_ports` list.
   - Inside the `content` block, `egress.value` is used to access the value of the current iteration, representing the egress port.

So, in summary, the iterator `port` (or `egress`) is used to access the default values of the `sg_ports` variable during each iteration of the dynamic block, allowing you to dynamically create multiple ingress and egress rules based on the values provided in the `sg_ports` list.

------------
