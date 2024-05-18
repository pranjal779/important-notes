time: 4:30

Now, here, one thing to note is that this ami id this is nothing but the id of the image from which

the server will get launched.

Generally, organizations that are based on AWS, they'll have an image where the application is already

configured and what you need to do.

You can launch the EC2 instance from that specific image and your application would be working pretty

well.

All right, so let's assume that your application is messed up, things are not working and you want

to recreate the instance once more.

So in such cases at this stage, if you do a terraform apply, let's try it once more.

You see it states no changes.

Your infrastructure matches the configuration.

However, if you'd like to recreate this specific resource, what you can do, you can say TerraForm,

apply hyphen replace.

And within here you can specify underscore, instance.name.

Here.

In this case it is my EC2, so I'll say my EC2.

Let's press enter.

Now you see it states one to add, one to destroy.

And if we go a bit up.

We can see here that the EC2 instance will be replaced.

So just for the workflow, let me just type.

Yes.

And see on what happens here.

So first it is destroying the earlier EC2 instance.

At this stage, the destruction process is complete, so the older EC2 is destroyed and now it will

start to create the newer EC2.

Great.

So our new EC2 instance is created.

Now if you'd like to verify, you can just refresh it.

And you see one instance that is running.

In fact, let me just deselect this so that we also see the terminated instance.

So the older instance is terminated and the newer instance is recently created.

All right.

So I hope with this you understood the basics of recreating the resource through TerraForm.

Now, before we conclude certain important pointers that you need to keep a note of first one, is that

similar kind of functionality that we are discussing was achieved using the TerraForm Taint command

in the older version of TerraForm.

However, from the TerraForm version, 0.15.2 and later Hashicorp recommends that you make use

of -replace option with the TerraForm, apply instead of TerraForm taint.

So in exams or even in real world scenarios in case if you hear the term terraform taint, it is nothing

but recreating the resource that were already created through TerraForm.

All right.

So that's the high level overview.
