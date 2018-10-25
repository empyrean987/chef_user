#
# Cookbook:: chef_user
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'users'

users_manage 'chef_users' do
  data_bag 'users'
  group_id 1000
  action [:remove, :create]
end	