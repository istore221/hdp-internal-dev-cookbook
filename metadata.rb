name 'hdpcluster'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs/Configures hdpcluster'
long_description 'Installs/Configures hdpcluster'
version '0.1.22'
chef_version '>= 12.14' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/hdpcluster/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/hdpcluster'
depends 'ssh_keygen', '~> 1.1.0'
depends 'chef-client', '~> 11.0.0'
depends 'java', '~> 2.2.0'
depends 'docker', '~> 4.6.4'
depends 'selinux', '~> 2.1.1'
depends 'ulimit', '~> 1.0.0'
depends 'nginx', '~> 8.1.5'
depends 'mysql', '~> 8.0'
