# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  elmsln-config-vagrant
# Recipe:: piwik-directories
#
# Licensed under the GPL, Version 2.0

case node[:platform]
when "debian", "ubuntu"
  bash "set-piwik-perms" do
    code <<-EOH
    (mkdir /var/www/elmsln/config/_nondrupal/piwik/tmp
    chmod -R 755 /var/www/elmsln/config/_nondrupal/piwik
    chown -R www-data:www-data /var/www/elmsln/config/_nondrupal/piwik
    chmod -R 755 /var/www/elmsln/core/_nondrupal/piwik
    chown -R www-data:www-data /var/www/elmsln/core/_nondrupal/piwik)
    EOH
    not_if { File.exists?("/var/www/elmsln/config/_nondrupal/piwik/tmp") }
    only_if { File.exists?("/var/www/elmsln/config/_nondrupal") }
  end
end
