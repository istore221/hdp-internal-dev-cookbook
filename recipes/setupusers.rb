#
# Cookbook:: hdpcluster
# Recipe:: setupusers
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#add sys users
users = search("users", "platform:centos_hdp")

users.each do |user_data|
	user user_data['id'] do
    comment user_data['comment']
    home user_data['home']
    shell user_data['shell']
    password user_data['password']
    manage_home true
	end
end

#add sudo users to wheel group
sudousers = search("users", "platform:centos_hdp AND sudo:true")

sudousers.each do |user_data|
  group 'wheel' do
    action :modify
    members user_data['id']
    append true
  end
end

#enable passwordless logins for sudo users
template '/etc/sudoers' do
  variables(
     'sudousers': sudousers
   )
  source 'sudoers.erb'
end

#generate ssh-keygen for all users
users.each do |user_data|
  directory "/home/#{user_data['id']}/.ssh" do
    action :create
  end
  ssh_keygen "/home/#{user_data['id']}/.ssh/id_rsa" do
    action :create
    owner user_data['id']
    group user_data['id']
    strength 4096
    type 'rsa'
    comment "#{user_data['id']}@localhost"
    secure_directory true
  end
end
