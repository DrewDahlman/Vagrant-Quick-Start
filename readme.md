##Vagrant Quick Start
A quick setup for rails apps using Vagrant & Puppet for rails projects.

##Required
1. Get and install VirtualBox: https://www.virtualbox.org/wiki/Downloads

2. Install Vagrant: <code>gem install vagrant</code>

3. Install vagrant-vbguest to stop Vagrant complaining about guest addition version: <code>gem install vagrant-vbguest</code>

##To Use
1. cd to rails app directory

2. Place vagrantup.sh in the root of the directory.

3. In terminal enter <code>chmod a+x vagrantup.sh</code>

4. <code>./vagrantup.sh</code>
This will grab a Vagrantfile & Puppet from s3 and get you rolling.

Vagrantup.sh will ask you about your Application and Database and will dynamically create your puppet file, databases, users and get everything ready for Development and Production Environments.

##Running Vagrant
After you have run vagrantup.sh you're free to:

<code>vagrant up</code>

<code>vagrant ssh</code>

<code>bundle install</code>

<code>rbenv rehash</code>

<code>rails s</code>


