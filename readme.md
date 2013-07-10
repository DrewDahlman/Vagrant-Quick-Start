##Vagrant Quick Start
A quick setup for rails apps using Vagrant for local dev.

##To Use
cd to rails app directory<br>
place vagrantup.sh in the root of the directory.<br>
in terminal enter <code>chmod a+x vagrantup.sh</code><br>
then <code>./vagrantup.sh</code><br>
This will grab a Vagrantfile & Puppet from s3.<br>

##Running Vagrant
After you have run vagrantup.sh you're free to:<br/>
<code>vagrant up</code><br>
<code>vagrant ssh</code><br>
<code>rbenv rehash</code><br>
<code>bundle install</code><br>
<code>rails s</code>


