# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  elmsln-config-vagrant
# Recipe:: vagrant-chown
#
# Licensed under the GPL, Version 2.0

case node[:platform]
when "debian", "ubuntu"
  bash "set-vagrant-chown" do
    code <<-EOH
    (chown -R vagrant:vagrant /var/www/elmsln)
    EOH
  end
end
