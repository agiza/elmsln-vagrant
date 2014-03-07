# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  elmsln-config-vagrant
# Recipe:: piwik-install
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
  # create database
  bash "create-piwik-db" do
    code <<-EOH
    (mysqladmin -u root -p"#{node['mysql']['server_root_password']}" create analytics_vu)
    EOH
  end
  # import an sql dump
  execute "import" do
    command "mysql -u root -p\"#{node['mysql']['server_root_password']}\" analytics_vu < /tmp/vagrant-chef-1/chef-solo-3/cookbooks/elmsln-config-vagrant/files/vagrant-piwik-default.sql"
    action :run
  end
end
