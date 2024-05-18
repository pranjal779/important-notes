-: Hi everyone and welcome back.

Now in today's video we are going to start

with the practical related

to the cross-resource attribute reference in Terraform.

Now the practical will be based on the workflow

that we had seen in the earliest slide

where we want a Elastic IP value to be wide listed

as part of the security group.

Now, as part of this, there are three primary resource types

that we will be needing.

One is the Elastic IP resource,

second is the security group resource.

Third is the security group rule resource.

Now I already have the documentation page associated

with all the resource open in different tabs.

I'll also be adding this link in our GitHub page

for easy reference.

So the first resource is the EIP.

Let's go ahead and quickly copy the resource here.

And within our KPLABS-Terraform folder,

I'll quickly create a file call

cross-reference-attributes.tf,

and within here, I'll add the resource of EIP.

Let's remove the instances part.

This is not required as part of today's video.

The second resource that we need is the AWS security group.

Let's also copy the basic structure

of the security group here.

Let's add it.

We'll remove the things that are not required

and are optional.

So a security group resource becomes three liner.

Now the name of the security group,

you can just say attribute-sg.

So this is the second resource that needs to be created.

And the third one is the security group rule.

Let's also copy the basic example associated with it.

So let's copy this and I'll add it over here.

So as we were discussing, you already have

a cross reference of resource attribute

of security group ID that is added here.

The next important part here is the port.

If you look into this specific diagram,

we need a port of 443 to be allowed

from the Elastic IP that gets created.

So here I'll just say port number 443.

Now one more thing that you have to keep a note of

is that in the security_group_id,

the name here of the security group,

the local resource name is example.

However, here it is allow_tls.

So you either change over here

or you either change over here, whatever suits you.

So just for simplicity, I'll just change over here.

Alright, so whatever ID that gets associated

with this security group will be computed

as part of this argument.

This is one part.

The next part is the cidr_ipv4 block.

So here instead of this specific address,

we need the address of the elastic IPv4 block here.

So one of the things that you might do initially,

as we know the syntax, let's revise the syntax,

is the resource type, the local resource name and attribute.

So the resource type will say aws_eip.

The name here is lb followed by the attribute

where the public IPv4 is stored.

So from the documentation you have to see

in which attribute this resource

is storing the public IPv4 address.

You can always check it from the documentation

in the attribute reference.

There is one part where the public IP address is stored,

which is public_ip.

So this is what you are going to add over here.

Alright, so at this stage the format is very similar

to the security_group_id.

You see, everything is very similar.

The resource is changed.

So let's do one thing.

Let's go ahead and verify if this code works.

Now from the CLI, I'll quickly do a terraform plan.

At this stage, it is showing three to add.

Now when you do a terraform apply again,

this is an important learning that terraform plan,

if it succeeds, does not mean that the terraform apply

will also succeed, all right?

Terraform apply can fail even though the plan

is showing successful here.

Let's verify that. So if I do a terraform apply,

let's do a -auto-approve.

Now at this stage what has happened is

the Elastic IP resources created successfully.

The security group resource has been created successfully.

So this is the security group resource.

Now the third resource,

which is the vpc_security_group_ingress_rule,

this is where the issue is.

Now, generally in production, when you see something

similar to this, you have half infrastructure

that is created.

Let's verify it.

Now from the AWS console,

let's verify the Elastic IP.

You see there is one Elastic IP that is created,

which is 233.58.

You should also have a security group that is created.

The name of the security group here is attribute-sg.

However, associated with this security group,

there is no security group rule

because our resource type failed.

So what exactly does this error says?

It says Invalid Attribute Value.

It is also showing you the exact line where the issue is.

Now if you look into the area here,

it states that attribute cidr_ipv4 value

must be a valid IPv4 CIDR block

that represents a network address.

And it is also showing what is the value it got.

Instead of this, it got this value,

which is 35.154.233.58.

And still it is showing an error.

Now if we copy this,

and just for simplicity, I wanted to show you one thing.

If you manually add this IPv4 address here,

let's verify if it gets successful now.

I will clear the screen,

I'll do a terraform apply again.

Again, you see we are getting the same error.

So why exactly this error is coming. Let's look into it.

Now, generally in AWS, whenever you are adding a new rule,

let me quickly show you,

whenever a new security group rule is added for any port,

whatever IP address that you add.

For example, let me just copy this IPv4 address.

I will add it over here.

Now when you just add it directly,

immediately you see you're getting an error

which states the CIDR block has to be specified.

So if I try to save this, I will not be able to.

So you have to specify the exact site.

It is also showing you like /32.

So this is much more better.

So generally, if you have something like 10.77.0.0,

you'll have to add the exact part,

which is either 16, 24, 32, et cetera.

So if it is a single IP address,

then it needs to be /32.

Alright, so what you need to do,

you have to find a way in which this cidr_ipv4 block

will be this value followed by 32.

So something similar to this is what you need.

So let's remove this part.

Let's add the attribute again.

Alright, so this gets computed followed by 32.

Something similar to this is what you need.

However, when you try to directly use this block,

this will fail.

Let's verify.

So when you do a terraform apply -auto-approve,

you see it failed again.

So what you need is, first you need the value to be computed

because you need this specific value to be computed.

After this value is computed, then you need the final value

to be added with /32 block.

So the first part is, let me show you.

So the first part is to compute this,

which terraform will do easily.

Then after this gets computed, then you want terraform

to add a 32 here, something similar to this

and then pass this value as part of the cidr_ipv4 block.

So if you want to achieve this,

then you need a string interpolation.

So what string interpolation does is,

let me quickly show you.

So you'll have to add it in a syntax,

something similar to this, all right.

So this part over here is

what we referred to as string interpolation.

So now what Terraform will do,

Terraform will first calculate

whatever value associated with this block is.

Then it'll add a /32

and then it'll pass it to the cidr_ipv4 block.

So with this, let's save it.

I'll clear the screen

and I'll do a terraform apply.

This time you see our apply has been completed successfully.

And if you see the of cidr_ipv4 block this time,

it is the IPv4, which is the EIP followed by /32.

So if you have to verify it,

let's open up the security group again.

In fact, let's refresh this.

Let's search by the name, which is attribute-sg.

And if you look into the inbound rule,

you see the EIP is computed.

Now one more thing that I wanted to share

before we conclude this video is that whenever you see

that your infrastructure is created half of.

So earlier we had two resources

that got created, one failed.

Then in the next supply, you ran the terraform apply,

it succeeded again.

Now from the infrastructure point of view,

this is not going to be an issue,

but generally it is recommended that Terraform

should be able to create the entire infrastructure in

the first call itself.

Even though if you try apply two, three times,

it is not going to be an issue.

But just as a smooth process,

you should ensure that it gets created in the first go.

So let's do one thing.

Let's destroy the infrastructure that we have created.

Oops, we made a small typo, it should be destroyed.

I'll do an -auto-approve.

And after it is destroyed,

you can run the terraform apply once again.

And this time we have ensured

that the entire process is smooth

and everything that gets created is created in one go.

And this is how you should be able to create

the production level code for your organization.

Now I have also added a slide related

to string interpolation where we were discussing

that anything that gets added as part of this block,

which is the dollar sign followed by the curly braces,

anything that is added over here,

Terraform will go ahead and replace it

with the calculated value, whatever it may be.

And then it passes it to the appropriate argument

while running the terraform apply.

So this is like a placeholder whose value

needs to be calculated by Terraform,

post, which it'll be passed on.

Now this string interpolation is useful in a lot of cases,

specifically whenever you are using expression.

We are going to discuss things in more detail

at a later stage,

but it is not always necessary

that you have to use string interpolation.

For example, in the security_group_id,

this also is one of the values

that will be computed by Terraform,

but we have not used string interpolation here.

However, in the cidr_ipv4 block,

since we are also adding the /32,

this is where things are needed

at a very high level overview here.
