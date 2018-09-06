#
# Cookbook:: hdpcluster
# Recipe:: nginx
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'nginx::default'

directory '/usr/share/nginx/repos' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end


template '/etc/nginx/conf.d/default.conf' do
  source 'nginx_conf.d_default.erb'
  notifies :reload, "service[nginx]", :immediately
end

service "nginx" do
  action [ :enable, :start ]
end
