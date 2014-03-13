# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  elmsln
# Recipe:: repo
#
# Licensed under the GPL, Version 2.0
#

case node[:platform]
when "debian", "ubuntu"
  git "/var/www/elmsln" do
    repository "git://github.com/btopro/elmsln.git"
    reference "master"
    action :sync
  end
end
