#!/bin/bash

#----------------------------------------------------------------------------
#
#	Vagrant Up 1.0
#	Quick setup of Vagrant for rails apps 
#
#----------------------------------------------------------------------------

# download Vagrantfile
curl -sS https://s3-us-west-2.amazonaws.com/usefulthings/Vagrantfile > Vagrantfile

# cd to config
cd config

# download puppet.zip
curl -sS https://s3-us-west-2.amazonaws.com/usefulthings/puppet.zip > puppet.zip
unzip puppet.zip
rm puppet.zip

cd ..

echo "done"