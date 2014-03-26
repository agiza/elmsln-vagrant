# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  elmsln-config-vagrant
# Recipe:: vagrant-performance
#
# Licensed under the GPL, Version 2.0
#

case node[:platform]
when "debian", "ubuntu"
  # force some settings to be as such by writing to the end of those files
  bash "performance-optimization" do
    code <<-EOH
    cat /var/www/elmsln/docs/php.txt >> /etc/php5/apache2/php.ini
    cat /var/www/elmsln/docs/apc.txt >> /etc/php5/apache2/conf.d/apc.ini
    cat /var/www/elmsln/docs/my.txt >> /etc/php5/apache2/conf.d/mysql.ini
    cat /var/www/elmsln/docs/my.txt >> /etc/php5/apache2/conf.d/mysqli.ini
    apachectl -k restart
    EOH
  end
end
