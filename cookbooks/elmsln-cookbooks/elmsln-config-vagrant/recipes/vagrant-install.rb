# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  elmsln-config-vagrant
# Recipe:: vagrant-install
#
# Licensed under the GPL, Version 2.0
#

case node[:platform]
when "debian", "ubuntu"
  # apply correct directory permissions for online site
  directory "/var/www/elmsln/config/private_files" do
    mode 0755
    owner "www-data"
    group "www-data"
  end
  directory "/var/www/elmsln/config/jobs" do
    mode 0755
    owner "www-data"
    group "www-data"
  end
end
