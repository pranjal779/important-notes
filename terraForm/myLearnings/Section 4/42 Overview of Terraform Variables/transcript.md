Now, in today's video, we are going to discuss

yet another very important topic as part of Terraform,

which is the Terraform variables.

Now, generally any production environment

that you will be working with or any larger code base,

variables are one of the common things

that you will see as part of the code.

So let's go ahead and understand the challenge,

post which, we look into how variable allows us to solve

that specific challenge.

Now, one of the important things

that we need to keep a note of

is that whenever you have a larger code base,

which has repeated static values,

it'll create a lot of issues and manual work in the future.

And ideally in any code that you write,

the repeated static values should always be avoided.

So let's go ahead and understand this with an example,

which states that you have a VPN server in your organization

and you want to whitelist the VPN server IP address

in the firewall rule for 5 specific ports.

If you look into the firewall rules,

it would look something similar to this.

So you having total of 5 ports,

80, 443, 22, 21, and 8080.

And the vpn_ip needs to be whitelisted.

So this is the vpn_ip

that you see over here in the CIDR block section.

And in all of the 5 ports you have a vpn_ip

that is whitelisted.

Now among this, which is the repeated static value

that you see, it is the vpn_ip.

And this is a very simple and a small example.

Whenever you are working with larger organization,

they have hundreds of rules.

And when you have the vpn_ip added in hundreds of rules,

it is a repeated static value

and it is going to create a lot

of work for you in the future.

Now, just for simplicity,

I have also added a reference screenshot related to it

where you have a firewall rule here,

and in the cidr_ipv4 block, you have the vpn_ip.

So this is a firewall rule 1.

Then you have firewall rule 2.

Again, the port differs,

but the vpn_ip remains to be the same.

So similar to this, in a larger organization,

you can have hundreds of rules

where this static value would be present.

Now, in order to avoid specifying the repeated static value

in your code, the better approach would be

to define this static value in a central place.

For example, let's say that you have a central location

where you specify that a vpn_ip is going to be this.

Now what you can do is that from the code of your Terraform,

so there are two rules over here.

You can create a logic in which the cidr_ipv4 block,

you see it states fetch-from-central-location.

So instead of hard-coding the IP everywhere in your code,

you just say fetch-from-central-location.

So now what it'll do, whatever central location

that you have defined,

it'll fetch the IP from the central location

and it'll be computed internally.

So tomorrow, let's say that you have

to change the IP address of the VPN server.

You have a new VPN server that has been configured

and it has a new IP.

So you don't have to modify all of the firewall rules

with a newer IP, all you have to do

is that in the central location,

just replace this with a newer IP and that's about it.

In the next Terraform apply,

it'll automatically fetch the latest IP

from the central location

and the firewall rules will be updated.

So this kind of an approach

is what you should be using in the production environment,

and this is going to make your life simple.

Now, this better approach

that we were discussing can be achieved in Terraform,

using the feature of variables,

at a high-level overview,

the Terraform input variables are used

to pass certain values from outside of the configuration.

So let's take an example

where you specify some key value pair here,

for example, vpn_ip,

you have a IP address of the VPN server.

You also have one more variable with the name of app_port

and the value is 8080.

So this is a different file altogether.

And the Terraform code that you write,

you do not hard-code the values here,

you create a logic in which the value associated

with these arguments can be fetched

from the central location

you can also refer to as a variable file.

For example, if you look into this code,

there are two specific variables that you have defined.

One is associated with a cidr_ipv4 block,

you see your var.vpn_ip, which is this specific block,

so it'll automatically take the IP value here.

Similarly, if you see, from_port and to_port,

Here also, instead of defining the port of 8080,

you have specified var.app_port,

so now Terraform will automatically look into the value

of app_port from the central location

that you have defined,

and the 8080 will be computed internally for you.

All right, so I hope with this, at a high-level overview,

you understood what variables are all about.

So let's have a quick demo

to understand this from practical point of view as well.

Now, similar to the screenshot that we had seen

as part of the PPT, we have a small code

where we have variables that are used.

Now again, note that this is a demo video.

We are not starting with a practical from scratch.

We'll have a different practical video

where we'll be starting things from scratch here.

Now, as part of the file that we have,

there are two resources that are defined.

One is the security \_group resource,

which creates the security_group,

a very simple resource to understand,

and the second one is the security_group rule resource.

Now within the rule resource here,

if you see the CIDR_ipv4 block is var.vpn_ip.

Now you can also hard-code the IP address of the VPN server,

but as we were discussing, this, in a longer run,

it is going to create issue.

Specifically when you have a large code base.

For example, currently you only have one rule,

but what happens if you have hundreds of rules

where the vpn_ip is whitelisted?

Then in such cases, if the VPN server IP changes,

then in all of the 100 rules

you'll have to manually modify the code block.

This is something that you do not really want

and this is the reason why,

what you do, you make it a variable.

So here you see you have var.vpn_ip,

and also for the port you have var.app_port.

So var here states that this is a variable,

and vpn_ip is the name of the variable.

Now associated with this specific code,

we also have one more file called a central-file.tf.

Now, if you look into the central-file,

you have a variable with the exact name of vpn_ip

that you have defined here, and it has a specific value.

Similarly, for app_port also,

you have a specific variable with the name

and you have a value that is associated.

Now generally, whenever you do a Terraform plan,

let's see if the values

are automatically being computed for us.

So here you see, for the vpc_security ingress_rule,

the cidr_ipv4 block is automatically taken from variable.

Similarly, in the from_port,

you see 8080 is automatically taken from the variable.

Now whenever you change the variable, for example,

let's just change it to 22, just for simplicity,

I just wanted to show you,

now, if you do a Terraform plan,

you see automatically the code base

has taken the latest value from the variable.

Great, so I hope with this at a high-level overview,

you understood what variables allows us to do.

Now, before we conclude today's video,

let's quickly revise the benefits that variables provide.

The first benefit is that it allows us

to update the important values in a central place

instead of searching and replacing it throughout the code,

saving time and potential mistakes.

Now, generally what happens is that in a larger code base,

when you have say hundreds of firewall rules,

when you want to change a specific vpn_ip in say 50

or 60 firewall rules, you are doing it manually.

Now, in such case, what happens is there are higher chances

of you making a mistake,

and this is the reason why you should always avoid

the repeated static values.

Along with that, since you have a central location

and there is only one place where you have

to modify the vpn_ip, it is going to save you a lot of time.

And the second pointer, also, it's quite related,

which states that,

no need to touch the core configuration file.

This can avoid human mistakes while editing.

Now since you have a central file where variable

and its values are stored, you don't have to touch

the main Terraform configuration file

where the resources are configured.

So in production environment, this is very important

because if you touch the Terraform configuration file,

there are always some chances of mistakes

which you can easily avoid

if you're using the variables here.

So that's a very high-level overview
