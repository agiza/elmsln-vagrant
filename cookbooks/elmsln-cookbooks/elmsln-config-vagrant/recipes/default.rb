# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  elmsln-config-vagrant
# Recipe:: default
#
# Licensed under the GPL, Version 2.0
#

case node[:platform]
when "debian", "ubuntu"
  # wipe current config directory and repull elmsln project as a whole
  # this is a hard reset of the branch to avoid conflicts w/ past editions
  bash "rebuild-elmsln-default" do
    code <<-EOH
    (
      rm -r -f /var/www/elmsln
      cd /var/www
      git clone git://github.com/btopro/elmsln.git elmsln
      cd elmsln
      rm -r -f /var/www/elmsln/config
    )
    EOH
  end
  # check out this specific config
  git "/var/www/elmsln/config" do
    repository "git://github.com/btopro/elmsln-config-vagrant.git"
    reference "master"
    action :sync
    not_if { File.exists?("/var/www/elmsln/config/scripts/drush-create-site/config.cfg") }
  end
  # resync code from the repo just incase above has already been run
  bash "checkout-latest-changes" do
    code <<-EOH
    (
      cd /var/www/elmsln/config
      git pull origin master
    )
    EOH
  end
end
