##Vagrant Quick Start
A quick setup for rails apps using Vagrant & Puppet for rails projects.

##Required
1. Get and install VirtualBox: https://www.virtualbox.org/wiki/Downloads

2. Install Vagrant:  
	<tt>gem install vagrant</tt>

3. Install vagrant-vbguest to stop Vagrant complaining about guest addition version:  
	<tt>gem install vagrant-vbguest</tt>

##To Use
1. cd to rails app directory

2. Place vagrantup.sh in the root of the directory.

3. In terminal enter <code>chmod a+x vagrantup.sh</code>

4. <code>./vagrantup.sh</code>
This will grab a Vagrantfile & Puppet from s3.

##Running Vagrant
After you have run vagrantup.sh you're free to:

<code>vagrant up</code>

<code>vagrant ssh</code>

<code>bundle install</code>

<code>rbenv rehash</code>

<code>rails s</code>


