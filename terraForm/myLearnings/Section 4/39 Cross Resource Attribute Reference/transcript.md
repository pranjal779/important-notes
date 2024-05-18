there are two resource that you are defining.
First one is the Elastic IP address resource,
we already know what this does.
Second is the security group resource.
Now the requirement here is that
in this specific security group,
you want to have a rule which allows the port 443
from the Elastic IP.
Whatever Elastic IP value that gets computed
after this EIP resource gets created
is the one that you want to whitelist
in the security group resource.
Now at this stage, when you have defined both of them
Elastic IP address value,
you will only get after the Elastic IP is created.
So the question that comes is
how can you whitelist this EIP
in the security group resource?
Some might say that first you can go ahead and create
a Elastic IP, whatever public IP that you get,
you add it as part of your security group resource
in Terraform.
However, this is very simple way of doing things
and this is not the right way as well.
So what you want is you want a solution in which
once the Elastic IP that gets created automatically,
whatever the value associated
with the public IP attribute is,
you want it to be added as part of the security group automatically.

So let's look into what is the workflow
that we are expecting.
First resource as we are discussing is the EIP resource.
Once the Elastic IP that gets created,
you will get some kind of a value.
So this is the static public IP that you will get.
After this value is something that you receive.
Then the security group resource should be created in a way
that the value as part of the security group resource
should automatically be computed or to be more precise,
it should automatically be taken from the Elastic IP
resource block after it got created here.
Now the question that comes is
how to add the Elastic IP address here.
For example, this specific resource block,
it creates a security group rule in AWS.
Now, while creating security group,
there is a specific argument of CIDR IPv4
where you have to add the IPv4 block,
which is this IPv4 associated with the Elastic IP.
So the question that comes is
how can you add it over here in a way
that it automatically gets computed
after the Elastic IP is created in AWS.
Now, in order to solve this scenario,
the attributes part of the Elastic IP
proves to be very useful.
So in such case, you have to analyze what are the attributes
that are stored as part of the EIP resource.
Now, if you look into the documentation,
one of the important attributes here
as part of the EIP resource is the public IP.
You see, the public IP attribute,
the description is contains the public IP address.
Now let me also quickly show you.
So in the documentation of AWS_EIP
if you go a bit down into that attribute reference.
So here you see you have a public IP attribute
that gets added as part of the state file,
which contains the public IP address,
whatever that gets created.
So based on our learning, this is what it looks like.
So after the Elastic IP that gets created in the attribute,
you have a public IP
and the appropriate value will be added.
So what is the solution here?
We have to find a way in which this specific attribute value
of public IP is referenced in the CIDR IPv4 block
of the security group.
So from the diagrammatic perspective,
it would look something similar to this
where after the Elastic IP resources created
and after the attribute is added as part of the state file,
then the security group resource
under the CIDR IPv4 argument,
it should automatically take this value
and it should add it over here.
And this is what we are planning
to understand in today's video.
Now, one of the great features
that HashiCorp provides is cross-referencing
the resource attributes.
So you can reference the attribute of one resource
to be used in a different resource.
And this essentially is a solution to the challenge.
Now if you look into the overall syntax
of cross-referencing the resource attribute,
it looks something similar to this where you have
to specify the resource type, the resource local name,
followed by the attribute that you want to reference.
So if you look into the final solution,
it would look something similar to this
where under the CIDR IPv4 block,
you specify the exact resource type,
which is AWS EIP,
the resource name, which is lb,
followed by the attribute associated with the resource,
which is public_ip.
So now what Terraform will do,
Terraform, after creating the Elastic IP,
then it'll create a security group.
And while creating the security group rule,
it'll fetch this specific value
from the public IP attribute of Elastic IP.
It'll add it over here
and it'll then apply the security group role.
And this is what keeps the overall things
much more simple and effective.

Let's have a quick demo to understand how things work.

In the next video, we are going to look into

the practicality aspect of this.

So at this stage, let's go ahead

and keep the theoretical part well understood.

Now for today's video we have a file

of cross-reference-attributes.tf

Again, this is just a demo video.

We are not starting with a practical from scratch.

Now what this file has defined,

it has defined Elastic IP resource,

very simple to understand.

It has defined a security group resource,

and the name of a security group is attribute firewall.

So this will just create a simple security group

and you also have a security group ingress rule.

So it'll create a new inbound rule

as part of the security group.

And within the CIDR IPv4 block,

this specific section you see we have a cross-reference

resource attribute here.

So we are referencing to a public_ip attribute

of the resource type of a AWW_EIP with a local name of lb.

So whatever the public IPv4 attribute associated

with this resource, whatever value is there,

it'll be computed as part of this block

and a security group rule will be created.

Now at this stage, let me also show you,

we do not have a Terraform.tf saved file here.

No resources are created.

All of the resources are going to be created anew,

and we are going to see on how things

get computed automatically.

This is one of the great benefits of Terraform.

I really like it and it makes life simple.

Now, from the CLI, again, note that this is a demo video.

Just as a reminder,

I'll quickly do a terraform apply it auto approve.

Let's see whether the EIP, the security group

and the rule gets created.

And great, it took a few seconds

and all of our resources are created.

Now from the AWS console,

let's first verify the Elastic IP here.

So our Elastic IP ends at 238.140.

Now after our Elastic IP is created,

let's also verify the security group.

Now at this stage we have a security group

of attribute firewall.

If you explore the security group here,

you see on the port of 80,

the source is the EIP, which is 238.140,

which is nothing but this Elastic IP here.

Now, one thing that we have to keep a note of is that

this specific security group rule

requires the Elastic IP value to be added.

So Terraform is intelligent

to understand this specific dependency

and this is the reason why if you would had looked into

the output here, first thing that Terraform does

is it creates the Elastic IP.

Only after it creates the Elastic IP,

yeah you see, the Elastic IP creation is completed.

Only after the Elastic IP is created,

then it creates the security group

and then it creates the security group rule.

So when you have such kind of a dependencies,

Terraform understands it

and the resources are created accordingly.

Now, one more interesting thing that I wanted to show you

before we conclude this video

is that in this specific code block,

there is one more cross reference

of resource attribute which has taken place apart from this.

Can you identify where exactly we have referenced

the resource attribute in one more place?

And the answer is the security group id.

Now if you look into our resource

of VPC security group ingress rule,

let's look into the arguments.

One of the important arguments that you have to mention,

and it is also required, is the security group ID.

Here, you have to specify the ID of the security group.

Now generally whenever you create a security group in AWS,

it comes with the ID.

So this is the ID that you have to mention here,

something similar to this.

Alright, it looks something similar to this.

Now the challenger is that this specific rule

that we are planning to add,

we want to add it in the security group

called as attribute firewall,

which has not yet been created.

So if a security group is not created,

you will never get the ID as well.

ID you only get after a resource is created.

And this is the reason why within here also

we have referenced the attribute.

What is the attribute that we have referenced? You see?

First let's look into the syntax.

Syntax is resource type,

the local name followed by the attribute.

So the resource type here is AWS security group.

This is easy to understand.

The name here is allow_tls.

This is a local resource name

followed by the attribute of ID.

Now if you look into the documentation

of AWS security group, let's look into the attributes here.

In the attributes associated with it

one of the important attribute is ID.

What exactly it means?

It means ID of the security group.

So after the security group resource gets created

in the state file, there will be a attribute of ID

with the appropriate value.

And then this specific part will get computed.

It'll fetch the value of that attribute here,

it'll add it here internally.

And then the overall resource gets created.

And this is the reason why if you see

only and only after the security group resources created

does the Terraform tries to create the ingress rule resource

because there is a dependency here.

If Terraform would directly try

to create the security group ruled resource,

it'll fail because it is dependent upon

the ID value attribute of the security group resource.

Alright, so I hope with this at a high level overview,

you understood on how we can reference

the resource attributes across multiple

resource types in Terraform.
