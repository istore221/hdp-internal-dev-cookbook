name 'hdpnode'
description 'HDP Node Role'
run_list  'recipe[selinux]','recipe[ulimit]','recipe[chef-client::default]','recipe[hdpcluster]','recipe[java]','recipe[hdpcluster::docker]'
default_attributes(

  "chef_client" => {
    "interval" => 60,
    "splay"  => 60
  },

  "java" => {
    "install_flavor" => "oracle",
    "jdk_version" => "8",
    "oracle" => {
      "accept_oracle_download_terms" => true
    }
  },

  "selinux" => {
    "status" => "disabled"
  },

  "ulimit" => {
    "users" => {
      "hdpuser" => {
        "filehandle_limit" => 80000,
        "core_hard_limit" => "unlimited"
      }
    }
  }
)
