#
# Cookbook:: hdpcluster
# Recipe:: docker
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#install docker
docker_installation_package 'default' do
  version '17.12.0'
  action :create
end

#start docker service
docker_service_manager 'default' do
  action :start
end

#add sudo users to docker group
sudousers = search("users", "platform:centos_hdp AND sudo:true")

sudousers.each do |user_data|
  group 'docker' do
      action :modify
      members user_data['id']
      append true
  end
end
