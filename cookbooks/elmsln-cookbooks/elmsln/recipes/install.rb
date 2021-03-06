# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  elmsln
# Recipe:: install
#
# Licensed under the GPL, Version 2.0
#

case node[:platform]
when "debian", "ubuntu"
  bash "install-elmsln-script" do
    code <<-EOH
    (bash /var/www/elmsln/scripts/install/elmsln-install.sh)
    EOH
    only_if { File.exists?("/var/www/elmsln/scripts/install/elmsln-install.sh") }
    not_if { File.exists?("/var/www/elmsln/config/stacks/online/sites/online/vu/files") }
  end
end
