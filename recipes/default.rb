#
# Cookbook:: hdpcluster
# Recipe:: default
# chef-client 14.1.12 requred
# Copyright:: 2018, The Authors, All Rights Reserved.

#kitchen install
#kitchen upload
#knife role from file roles/hdpnode.rb
#make sure chef-client version 14.1.12

#set hostnames
template '/etc/hosts' do
  source 'hosts.erb'
end

#enable public key authentication and reload sshd
template '/etc/ssh/sshd_config' do
  source 'sshd_config.erb'
  notifies :reload, "service[sshd]", :immediately
end

#etc/profile
template '/etc/profile' do
  source 'profile.erb'
end

#etc/bashrc
template '/etc/bashrc' do
  source 'bashrc.erb'
end

#down firewall
service "firewalld" do
  action [ :disable, :stop ]
end


#start ssh service
service "sshd" do
  action :start
end

package 'ntp'

service "ntpd" do
  action [ :enable, :start ]
end

template '/etc/sysconfig/network' do
  source 'network.erb'
end

template '/etc/yum.repos.d/ambari.repo' do
  source 'ambari.erb'
end

template '/etc/sysctl.conf' do
  source 'sysctld.erb'
end




include_recipe 'hdpcluster::setupusers'
