#
# Cookbook:: chef_user
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'users'

users_manage 'chefusers' do
  data_bag 'users'
  group_name 'chefusers'
  group_id 8819
  action [:remove, :create]
end	

directory node['chef_user']['py_user_dir'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

git node['chef_user']['py_user_dir'] do
  repository node['chef_user']['git_py_user']
  revision 'master'
  action :sync
end