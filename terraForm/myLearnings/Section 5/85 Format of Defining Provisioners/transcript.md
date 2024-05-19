it is important for us

to understand the overall format

on how we can define provisioners in our Terraform code

so that the practical becomes much more easier.

Now in today's video,

we are going to look into it from theoretical perspective

about how provisioners can be defined,

and then in the later videos we'll start with a practical

for each set of provisioner available.

Now the point number one that needs to be remembered

at an overview is that the provisioners are defined

inside a specific resource.

For example, here we have a resource of EC2 instance.

So whatever provisioners that you create,

you have to add it inside the resource block.

So here you have the opening curly braces,

you have the closing curly braces.

So provisioner must be inside the resource.

It should not be outside of the resource.

So this is point number one that needs to be remembered.

The point number two is that whatever provisioner

that you define, the overall format is you have

to specify provisioner followed by the type of provisioner.

For example, you have provisioner, local exec,

provisioner, remote exec.

If you are implementing file provisioner,

then it'll be provisioner file, all right?

So this is the second important pointer

that needs to be noted.

Now point number three is associated

with a local provisioner.

So after you have defined the local exec provisioner,

then you also have to specify the command that needs

to be done in the local machine where Terraform is running.

For example, in the earlier slide,

we had just defined the provisioner type.

So provisioner local exec and inside the curly braces

we have not defined what needs to be done.

So this is what we are learning in the slide number three,

where after you have defined a local exec provisioner,

you also have to specify the command

that needs to be done in the local system.

In this case, we are running a simple echo command,

which will say, "Server has been created through Terraform."

So this is something that you will see as part of the CLI.

Now let me in fact show you

so that there is no confusion here.

So generally, when you run the echo command stating,

"Hi from Terraform,"

in the output you will see, "Hi from Terraform."

So this is what echo command does.

Whatever you specify is the one that you get

as part of the output.

So this is what you are seeing as part

of the local provisioner.

You see echo, so it'll show you this part,

"Server has been created through Terraform"

as part of the output when you run the Terraform apply

and after the server has been created.

So this is for the local exec provisioner.

Now when we discuss about remote exec provisioner,

the overall approach is a little different.

So first, as we were discussing, is provisioner remote exec.

And here also you specify the command

like, "yum y install nginx," "systemctl start nginx."

So these commands that we have specified,

it will run in the server that has been created.

It will not run in the local system.

This is the part number one where whatever command

that you want to run on the server, you have to specify it

under the provisioner remote exec block.

This is first part.

Second, very important part in remote exec,

as we have learned, that for remote exec,

Terraform has to connect to the server through SSH

and other protocols that are available.

So you have to specify the connection related information.

So this is very important.

So you have to specify the protocol,

you have to specify the user in this case.

It is easy to user.

You have to specify the key

through which Terraform can connect to the server.

So this is the key,

and then you have to specify the IP address of the server.

So as part of remote exec, there are two important block.

One is the connection block, which contains the protocol,

the username, the private key, and so on.

And second one is the remote exec block,

which contains the command required to run the server.

Now before we conclude today's video, let me also show you

how it looks from the documentation perspective.

Now if you look into the local exec provisioner,

you have a resource, whatever resource it is.

Then you specify the provisioner.

The type of provisioner in this case is local exec.

Then you specify the command that you want to run

in the local workstation, whatever it may be.

This is very simple approach for local exec provisioner.

If you look into the remote exec provisioner, again,

it is mentioned inside the resource.

And for remote exec, there are two important blocks.

One is the connection block,

and second is the actual provisioner block.
