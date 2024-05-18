Let's see if it is able to detect newer AMI associated

with the ap-south-1 region.

And yes, automatically, the newer AMI is being populated.

All right, now, just for simplicity to make sure

that everything is working, I'll also do a terraform apply

with auto-approve to ensure that there are no errors

and suddenly, we got an error stating InvalidParameterValue.

The architecture of the specified instance type

does not match the architecture 'arm64'

of the specified AMI.

So in fact, let me also quickly show you

why we are getting this error.

Now, within the filter,

if you would notice, we have explicitly specified

in the value we had specified arm64-server.

So in such case,

not all of the instance types are supported.

So for example, whenever you try

to launch a instance using the AWS console

and you select the Ubuntu AMI ID, all right?

In fact, let's copy the AMI ID.

Let's go back to the EC2 console.

In the AMIs, the public images,

I'll search the AMI ID that we just copied.

Now, if you explore this AMI ID,

the architecture here is x86_64.

Along with that, the AMI name is also a little different.

It is ubuntu/images/hvm-ssd/ubuntu-jammy-amd64-server,

followed by the timestamp.

So in such case, you can use this AMI.

In fact, let's copy till here. Let's replace this.

All right, so now you are using the amd64 and not the ARM.

I'll save this.

So now let's go ahead

and verify if our terraform apply operation works

and great, our apply has been completed successfully.

And if you look into the Mumbai region,

the instances, you see we have one instance

that is successfully launched.

All right, so I hope with this at a high-level overview,

you understood the entire structure

on how data sources can be used

to fetch the AMI ID based on the filters

that you have specified

and the EC2 instance can be created accordingly.

So with this, we'll conclude today's practical video.
