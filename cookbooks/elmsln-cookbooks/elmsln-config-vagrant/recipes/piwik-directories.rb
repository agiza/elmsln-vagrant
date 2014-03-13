# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  elmsln-config-vagrant
# Recipe:: piwik-directories
#
# Licensed under the GPL, Version 2.0

case node[:platform]
when "debian", "ubuntu"
  # apply correct directory permissions for online site
  directory "/var/www/elmsln/config/_nondrupal/piwik" do
    mode 0755
    owner "www-data"
    group "www-data"
    recursive true
  end
  # apply correct directory permissions for online site
  directory "/var/www/elmsln/config/_nondrupal/piwik/tmp" do
    mode 0755
    owner "www-data"
    group "www-data"
    action :create
  end
  # apply correct directory permissions for online site
  directory "/var/www/elmsln/core/_nondrupal/piwik" do
    mode 0755
    owner "www-data"
    group "www-data"
    recursive true
  end
end
