#
# Cookbook:: hdpcluster
# Recipe:: mysql
#
# Copyright:: 2018, The Authors, All Rights Reserved.

mysql_service 'foo' do
  port '3306'
  version '5.5'
  initial_root_password 'mypassword'
  action [:create, :start]
end
