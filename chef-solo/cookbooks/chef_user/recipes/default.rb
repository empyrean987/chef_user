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
  force true
end	
