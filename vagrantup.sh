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

#----------------------------------------------------------------------------
#
# Config
#
#----------------------------------------------------------------------------

# make tmp file
touch puppet/manifests/vagrant_temp.pp || exit
touch puppet/templates/database_tmp.yml.erb || exit

cat puppet/manifests/vagrant_temp.pp > puppet/manifests/vagrant_temp.pp
cat puppet/templates/database_tmp.yml.erb > puppet/templates/database_tmp.yml.erb

echo "##------------------ CONFIG -----------------##"
read -p "What is your application name? " response
sed -e '4 c\
	$app_name = "'$response'"
	' puppet/manifests/vagrant.pp >> puppet/manifests/vagrant_temp.pp
mv puppet/manifests/vagrant_temp.pp puppet/manifests/vagrant.pp

echo "##------------------ DEVELOPMENT CONFIG -----------------##"

# DB NAME
read -p "What is your Database name? " response
sed -e '5 c\
	\  database: '$response'
	' puppet/templates/database.yml.erb >> puppet/templates/database_tmp.yml.erb
mv puppet/templates/database_tmp.yml.erb puppet/templates/database.yml.erb

#DB USER
read -p "Database User: " response
sed -e '5 c\
	$DB_USER = "'$response'"
	' puppet/manifests/vagrant.pp >> puppet/manifests/vagrant_temp.pp
sed -e '6 c\
	\  username: '$response'
	' puppet/templates/database.yml.erb >> puppet/templates/database_tmp.yml.erb
mv puppet/manifests/vagrant_temp.pp puppet/manifests/vagrant.pp
mv puppet/templates/database_tmp.yml.erb puppet/templates/database.yml.erb

# DB PASS
read -p "Database Pass: " response
sed -e '6 c\
	$DB_PASS = "'$response'"
	' puppet/manifests/vagrant.pp >> puppet/manifests/vagrant_temp.pp
sed -e '7 c\
	\  password: '$response'
	' puppet/templates/database.yml.erb >> puppet/templates/database_tmp.yml.erb
mv puppet/manifests/vagrant_temp.pp puppet/manifests/vagrant.pp
mv puppet/templates/database_tmp.yml.erb puppet/templates/database.yml.erb

echo "##------------------ PRODUCTION CONFIG -----------------##"
read -p "What is your Database name? " response
sed -e '15 c\
	\  database: '$response'
	' puppet/templates/database.yml.erb >> puppet/templates/database_tmp.yml.erb
mv puppet/templates/database_tmp.yml.erb puppet/templates/database.yml.erb

read -p "Database User: " response
sed -e '7 c\
	$DB_USER_PROD = "'$response'"
	' puppet/manifests/vagrant.pp >> puppet/manifests/vagrant_temp.pp
sed -e '16 c\
	\  username: '$response'
	' puppet/templates/database.yml.erb >> puppet/templates/database_tmp.yml.erb
mv puppet/manifests/vagrant_temp.pp puppet/manifests/vagrant.pp
mv puppet/templates/database_tmp.yml.erb puppet/templates/database.yml.erb

read -p "Database Pass: " response
sed -e '8 c\
	$DB_PASS_PROD = "'$response'"
	' puppet/manifests/vagrant.pp >> puppet/manifests/vagrant_temp.pp
sed -e '17 c\
	\  username: '$response'
	' puppet/templates/database.yml.erb >> puppet/templates/database_tmp.yml.erb
mv puppet/manifests/vagrant_temp.pp puppet/manifests/vagrant.pp
mv puppet/templates/database_tmp.yml.erb puppet/templates/database.yml.erb

#----------------------------------------------------------------------------
#
# Cleanup and go back to root
#
#----------------------------------------------------------------------------

cd ..

echo "done"