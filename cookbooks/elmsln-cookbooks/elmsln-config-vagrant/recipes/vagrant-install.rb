# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  elmsln-config-vagrant
# Recipe:: vagrant-install
#
# Licensed under the GPL, Version 2.0
#

case node[:platform]
when "debian", "ubuntu"
  # apply correct directory permissions
  directory "/var/www/elmsln/config/stacks/online/sites/online/vu/files" do
      mode 0777
      owner "root"
      group "root"
    end
end
