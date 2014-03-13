# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  elmsln
# Recipe:: hook-up-host-dev
#
# Licensed under the GPL, Version 2.0
#

case node[:platform]
when "debian", "ubuntu"
  # hook up the drush-create-site job processor
  bash "move-outside-root-post-install" do
    code <<-EOH
    (
      mv /var/www/elmsln/* /_elmslndev
      rm -rf /var/www/elmsln
      ln -s /_elmslndev/ /var/www/elmsln
    )
    EOH
    only_if { File.exists?("/var/www/elmsln") }
  end
end
