# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  elmsln
# Recipe:: drush-aliases
#
# Licensed under the GPL, Version 2.0
#

case node[:platform]
when "debian", "ubuntu"
  # create drush directory for vagrant user
  directory "/home/vagrant/.drush" do
    mode 0755
    owner "vagrant"
    group "vagrant"
  end
  bash "cp-elmsln-drush-defaults" do
    code <<-EOH
    (cp -R /var/www/elmsln/config/scripts/drush/server/* /home/vagrant/.drush/)
    EOH
  end
  # wipe current config directory
  bash "drush-cc-drush" do
    code <<-EOH
    (drush cc drush)
    EOH
  end
end
