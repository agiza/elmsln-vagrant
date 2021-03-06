# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  elmsln
# Recipe:: repo
#
# Licensed under the GPL, Version 2.0
#

case node[:platform]
when "debian", "ubuntu"
  bash "update-elmsln-repo" do
    code <<-EOH
    (cd /var/www/elmsln
      git pull origin master)
    EOH
    only_if { File.exists?("/var/www/elmsln") }
  end
end
