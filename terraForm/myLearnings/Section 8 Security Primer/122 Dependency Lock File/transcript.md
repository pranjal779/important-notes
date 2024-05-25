Now, in today's video, we are going to discuss about the dependency lock file.

Now, many of you might have observed that when you run the TerraForm in it, in the folder where the

state files are stored, there is also one more file that gets automatically created with the name of

TerraForm.lock.hcl.

If you have not observed, that is also fine because we are going to start with the practicals from

scratch regarding that.

However, in today's video we are going to precisely be looking into the importance of the TerraForm

dot lock file.

Now, before we proceed further, let's go ahead and quickly revise the basics related to the TerraForm

and the provider plugins release cycle.

So one important part that we need to keep a note of is that the provider plugins and TerraForm are

managed independently of each other and they also have a separate release cycle.

Now at this stage we know that there are thousands of providers that are available which you can make

use of and all of those providers have a independent different release cycle here.

So let's quickly understand this.

So let's assume that you have a TerraForm on version 1.2.

Along with that, you have a provider plugin of version one and which is the provider.

The provider is AWS.

Now, after few weeks, a new version of AWS Provider got released, which is version two again after

few weeks.

A next version of provider plugin that got released is version three.

So the aim here is to understand that the release cycle of both TerraForm and the provider plugins are

independent of each other.

It can happen that the TerraForm is still on version 1.2 and there are multiple updates to the provider

plugins now, although this is good, but this can introduce some challenges in the production environments.

So let's go ahead and discuss more in detail.

So let's assume that you have written a specific code based on TerraForm version 1.2, and when you

run the TerraForm in it, at that time there was only the version, one of the provider plugin that

was available, and you have tested the entire code, you have tested all of the modules in the code.

Everything is working perfectly well with the version one of the plugin.

Now, after you have created the infrastructure, you have committed the code to the GitHub repository

where it will be centrally stored.

Now it can happen that the code that is working with the version one of the plugin might not work pretty

well with the later versions of the code.

So for example, let's say after few weeks version two of the AWS provider plugin got released and maybe

after a few weeks the version three of the AWS provider plugin got released.

Now someone from your organization may be, let's say after a month or two when he downloads your code

from the GitHub repository and when he runs the TerraForm in it.

In such cases, which provider plugin will he download?

He'll download the version three of the provider plugin and it can happen that your code is not working

pretty well with the version three.

Now this can be due to multiple issues.

It can be also a bug at the plugin level due to which the code is not working as expected.

Now, generally this does not happen quite often, but sometimes this is the use case and hence you

need to keep a aware of.

So generally if your code is not working with the latest plugins, you can look into the issues that

the plugin has in its GitHub page.

Or maybe the plugin has introduced some new kind of a functionality where it expects certain minor modification

in the code.

Now the question that comes is in production environments, what is the way in which we can ensure that

this code uses only the version one of the provider plugin?

And the answer to this is the version constraints.

So within the code you can specify the appropriate version to which the code is thoroughly tested and

working pretty well.

So in here, also in the required providers, you can specify the exact versions.

Now if you look into the screenshot in the version, you have a specific range.

So it can happen that the provider plugin that will get installed, it can be 4.5, it can be 4.6 and

so on.

However, you can also specify the exact version.

Let's say you only want version 4.4.

You can also specify that as part of the version.

Now, based on the version constraints that you add, and once you run the TerraForm init after TerraForm

selects a specific version of the dependency.

TerraForm also remembers that and adds it as part of the log file so that it can use it as default in

the future.

For example, here, as we are discussing based on this code, a version of 4.2, 4.4, 4.6, any of

them can be downloaded.

So once a specific version is downloaded, TerraForm will go ahead and add the version in a file called

as TerraForm dot log.

So here you see the constraints here is at 4.0.

However, the version that was downloaded while running.

The TerraForm in it for the first time is 4.62.0.

So now what will happen is any other developer who pulls your code from the central repository and when

he runs TerraForm in it, it can happen that 4.7, 4.8 or 4.9 version of the AWS provider plugin was also

released.

However, the newer version will not get initialized.

Only the version of 4.62.0, which is part of the TerraForm log will get downloaded.

So let's do one thing.

Let's go ahead and quickly understand this from practical point of view so that our concepts are clear.

So for today's video in our kplabs TerraForm folder, we have a very simple file called as demo.tf.

Now, similar to the screenshot, we have specified a provider and we have also specified the range

of versions based on which the provider plugin gets installed.

So at this stage only one demo.tf file is present.

So let's go ahead and run terraform init and observe what are the things that gets added.

So from the CLI, let's quickly do a terraform init.

So based on our version constraints, it is trying to find the matching version and at this stage it

is installing 4.62.0.

Now note that in your case, maybe after you try, after few weeks, you might see 4.7 or 4.8 version

which matches your version constraints.

Now that your provider plugins have been installed, if you open up the folder once more, you will

see that a new file called as TerraForm Dot log has been created.

Now going back to our editor, if you open the TerraForm dot lock dot hcl, you will see that the constraints

as we have defined is available and also the version of 4.62.0 is added in the lock file.

So tomorrow, if a new developer downloads the same code using the same version constraints, considering

that let's say a 4.7 or 4.8 version of AWS provider has been available, the TerraForm will not download

that.

It will only download the provider plugin that matches the version that is part of the TerraForm dot

lock dot hcl.

All right.

So I hope with this you understood one of the important benefits of the lock dot hcl file.

Now one of the question that comes is what happens when you have the lock file with a specific version

that is available and then you update your tf file to include a specific version, which is different from

the lock file.

This is a very important question that comes.

So let's say that in here in the demo.tf we have now specified the version as 4.60.

However, in the lock file that got created during the first initialization, it has lock to 4.62 version.

So in such case, when the code is updated, which does not match to the lock file in such cases, when

you run the terraform in it again, then it will give you an error.

So let's go ahead and also try it out.

So let's say that our version is 4.62 here and within the required providers, I'll remove this and

I'll specify 4.60 and I'll save it.

Now, at this stage, if you quickly look into the TerraForm.

As we saw that the 4.62.0 is installed due to some reason.

Let's assume that there is some issue with this specific provider plugin and you want to switch back

to 4.60.

So you added the 4.60 version here.

Let's clear the screen and now you want the provider plugin of 4.60 to be available.

So what you will do you will do a terraform init.

Now as soon as you do that, since the 4.60 is not matching the lock file immediately you see you got

an error and this is the reason why.

It is also important for us to understand on how we can upgrade or downgrade to a specific provider

plugin, even though it is not matching to the list that you have defined in the lock dot hcl file.

So as part of the overall upgrade, Hashicorp recommends that along with the terraform init, you specify

the hyphen upgrade option for example.

You see in this screenshot we have terraform init hyphen upgrade and how this time it is using the 4.60

version that you have defined as part of your demo TF file.

So let's go ahead and also quickly look into this.

So this time let's clear the screen.

I'll say terraform init hyphen upgrade.

And this time, based on the version constraints you see, the 4.60 version of the provider is getting

installed.

Now, before we conclude certain points that we need to keep a note of, first one is that when you

install a specific provider for the first time, TerraForm will also pre-populate the hash value with

any checksum that are covered by the provider's developer's cryptographic signature.

For example, if you look into the lock dot hcl file along with the version, you also have the hashes that are

available, and these are associated with different platforms that the provider version is supported

on.

So at an overview, this ensures that only the exact version is getting installed in case if there is

a mismatch in the provider plugins and the overall signature, the initialization overall will fail.

So this is one point that you need to keep a note of at a very high level overview.

Now before we conclude a few important points to keep a note of.

First one is that at present the dependency lock file tracks only the provider dependencies.

It does not remember the version selection for the remote modules, and in such cases, if you have

those, then terraform will always select the newest available module version based on the version constraints.

So that's a very high level overview about the TerraForm lock dot hcl file.
