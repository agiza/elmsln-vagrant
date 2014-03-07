# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  elmsln-config-vagrant
# Recipe:: piwik-install
#
# Licensed under the GPL, Version 2.0
#

case node[:platform]
when "debian", "ubuntu"
  # apply correct directory permissions for online site
  directory "/var/www/elmsln/core/_nondrupal/piwik" do
    mode 0755
    owner "www-data"
    group "www-data"
  end
  # apply correct directory permissions for online site
  directory "/var/www/elmsln/core/_nondrupal/piwik/tmp/" do
    mode 0755
    owner "www-data"
    group "www-data"
    action :create
    recursive true
  end
  #run mysql commands to import the default state
  mysql_connection_info = {
    :host => "localhost",
    :username => "root",
    :password => node['mysql']['server_root_password']
  }

  # drop if exists, then create a mysql database named DB_NAME
  mysql_database "analytics_vu" do
    connection mysql_connection_info
    action [:drop, :create]
  end

  # import from a dump file directly after installation
  mysql_database "analytics_vu" do
    connection mysql_connection_info
    sql "source /vagrant/cookbooks/elmsln-cookbooks/elmsln-config-vagrant
/files/vagrant-piwik-default.sql;"
  end
end
