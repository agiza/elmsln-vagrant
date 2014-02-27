# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  elmsln
# Recipe:: default
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
  # make a shortcut in home directory to elmsln instance
  bash "make-elmsln-symlink" do
    code <<-EOH
    (ln -s /var/www/elmsln /home/vagrant/elmsln)
    EOH
    not_if { File.exists?("/home/vagrant/elmsln") }
    only_if { File.exists?("/var/www/elmsln") }
  end
  # hook up the drush-create-site job processor
  bash "make-drush-create-site-symlink" do
    code <<-EOH
    (ln -s /var/www/elmsln/scripts/drush-create-site /usr/bin/drush-create-site)
    EOH
    not_if { File.exists?("/usr/bin/drush-create-site") }
    only_if { File.exists?("/var/www/elmsln/scripts/drush-create-site") }
  end
end
