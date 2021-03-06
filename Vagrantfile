# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # This is the base box this image was originally produced from for documentation
  # purposes. If you want to use the base-box or modify it see Vagrantfile-baseSystem
  #config.vm.box = "precise64"
  #config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  # This is useful if packaging from the base-routine and wanting to use a local box
  #config.vm.box = "elmsln"
  #config.vm.box_url="elmsln.box"

  # This is the official ELMSLN.box VM that lives in vagrantcloud
  config.vm.box = "btopro/elmsln"


  # private network port maping, host files point to elmsln domains
  config.vm.network "private_network", ip: "10.0.0.10"
  config.vm.network "private_network", ip: "10.0.0.11"
  config.vm.network "private_network", ip: "10.0.0.12"
  config.vm.network "private_network", ip: "10.0.0.13"
  config.vm.network "private_network", ip: "10.0.0.14"
  config.vm.network "private_network", ip: "10.0.0.15"
  config.vm.network "private_network", ip: "10.0.0.16"
  # forward the vm ports for database and apache to local ones
  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.network "forwarded_port", guest: 3306, host: 3306

  # mount directory
  config.vm.synced_folder ".", "/vagrant"

  config.vm.provider "virtualbox" do |v|
    host = RbConfig::CONFIG['host_os']

    # Give VM 1/4 system memory & access to all cpu cores on the host
    if host =~ /darwin/
      cpus = `sysctl -n hw.ncpu`.to_i
      # sysctl returns Bytes and we need to convert to MB
      mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
    elsif host =~ /linux/
      cpus = `nproc`.to_i
      # meminfo shows KB and we need to convert to MB
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
    else # sorry Windows folks, I can't help you
      cpus = 2
      mem = 1024
    end

    v.customize ["modifyvm", :id, "--memory", mem]
    v.customize ["modifyvm", :id, "--cpus", cpus]
  end

  # chef commands to set up everything
  config.vm.provision "chef_solo" do |chef|
    # This path will be expanded relative to the project directory
    chef.cookbooks_path = ["cookbooks/elmsln-cookbooks"]

    #chef.add_recipe("vim")

    chef.roles_path = "roles"

    # This role represents our ELMSLN sub-box command stack. This assumes the
    # heavy lifting has all been done in a standard way in our elmsln.box VM
    # that was downloaded. The VM will be versioned periodically when changes
    # are required for the base-build but thus far git checkouts overtop of
    # the elmsln and elmsln-config-vagrant repos are all that's needed to work.
    chef.add_role("elmsln_subbox")
  end

  # all done! tell them how to login
  config.vm.provision "shell",
    inline: "echo 'finished! go to http://online.elmsln.local and login with username admin and password admin. to edit files on the box point an sftp client to /var/www/elmsln on 0.0.0.0 u/p vagrant/vagrant port 2222.'"
end

# Returns true if we are running on a MS windows platform, false otherwise.
def Kernel.is_windows?
  processor, platform, *rest = RUBY_PLATFORM.split("-")
  platform == 'mswin32' || platform == 'mswin64' || platform == 'mingw32' || platform == 'mingw32'
end
