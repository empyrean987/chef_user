#/bin/bash
echo "YO YO"
echo "Updating OS"
sudo apt-get update
sudo apt-get -y upgrade 
echo "verifying chef"
dpkg --list | grep chef > chef.txt
if [ -s chef.txt ]
then
  echo " chef is installed"
else
  echo "installing chef"
  wget https://packages.chef.io/files/stable/chef/13.6.4/ubuntu/16.04/chef_13.6.4-1_amd64.deb
  dpkg -i chef_13.6.4-1_amd64.deb
fi
wget https://packages.chef.io/files/stable/chefdk/2.4.17/ubuntu/16.04/chefdk_2.4.17-1_amd64.deb
sudo dpkg -i chefdk_2.4.17-1_amd64.deb 
echo "Pulling down chef cookbooks"
chef-solo -c /home/ubuntu/chef_wordpress/chef-solo/solo.rb
