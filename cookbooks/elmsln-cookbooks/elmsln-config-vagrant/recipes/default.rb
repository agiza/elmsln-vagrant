# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  elmsln-config-vagrant
# Recipe:: default
#
# Licensed under the GPL, Version 2.0
#

case node[:platform]
when "debian", "ubuntu"
  # wipe current config directory
  bash "remove-default-elmsln-config" do
    code <<-EOH
    (rm -r -f /var/www/elmsln/config)
    EOH
    not_if { File.exists?("/var/www/elmsln/config/scripts/drush-create-site/config.cfg") }
  end
  # check out this specific config
  git "/var/www/elmsln/config" do
    repository "git://github.com/btopro/elmsln-config-vagrant.git"
    reference "master"
    action :sync
    not_if { File.exists?("/var/www/elmsln/config/scripts/drush-create-site/config.cfg") }
  end
end
