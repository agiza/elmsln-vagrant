# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  elmsln-config-vagrant
# Recipe:: vagrant-install
#
# Licensed under the GPL, Version 2.0
#

case node[:platform]
when "debian", "ubuntu"
  # apply correct directory permissions for online site
  directory "/var/www/elmsln/config/private_files" do
    mode 0755
    owner "www-data"
    group "www-data"
  end
  directory "/var/www/elmsln/config/jobs" do
    mode 0755
    owner "www-data"
    group "www-data"
  end
  bash "set-online-dir-perms" do
    code <<-EOH
    (
      chmod -R 755 /var/www/elmsln/core/dslmcode/stacks/online/sites/online/vu/files
      chown -R www-data:www-data /var/www/elmsln/core/dslmcode/stacks/online/sites/online/vu/files
      chmod -R 755 /var/www/elmsln/core/dslmcode/stacks/online/sites/online/services/vu/files
      chown -R www-data:www-data /var/www/elmsln/core/dslmcode/stacks/online/sites/online/services/vu/files
    )
    EOH
    only_if { File.exists?("/var/www/elmsln/core/dslmcode/stacks/online/sites/online/vu/files") }
  end
  # hook up crontab
  bash "hook-up-crontab" do
    code <<-EOH
    (
      printf "\n\n#ELMSLN cron.php calls, at least 1 per stack\n" >> /etc/crontab
      printf "02 05 * * * root /usr/bin/php /var/www/elmsln/core/dslmcode/stacks/courses/sites/cron.php\n" >> /etc/crontab
      printf "02 10 * * * root /usr/bin/php /var/www/elmsln/core/dslmcode/stacks/media/sites/cron.php\n" >> /etc/crontab
      printf "02 15 * * * root /usr/bin/php /var/www/elmsln/core/dslmcode/stacks/online/sites/cron.php\n" >> /etc/crontab
      printf "#ELMSLN drush-create-site activation for site request processing\n" >> /etc/crontab
      printf "* * * * * root  /usr/local/bin/drush-create-site/drush-create-site >> /var/log/drush.log\n" >> /etc/crontab
      printf "#ELMSLN flush pac caches nightly to prevent overfragmentation\n" >> /etc/crontab
      printf "00 05 * * * root /etc/init.d/httpd reload\n" >> /etc/crontab
    )
    EOH
  end
  # symlink drush create site scripts into scope of bin
  bash "drush-create-site-sym" do
    code <<-EOH
    (ln -s /var/www/elmsln/scripts/drush-create-site /usr/local/bin/drush-create-site)
    EOH
  end
  # shortcut for drush-remove-site script
  bash "drush-remove-site-sym" do
    code <<-EOH
    printf "\n\nalias drs='/usr/local/bin/drush-create-site/rm-site.sh'\n" >> /home/vagrant/.bashrc
    printf "alias d='drush'\n" >> /home/vagrant/.bashrc
    printf "alias g='git'\n" >> /home/vagrant/.bashrc
    printf "alias l='ls -lah'\n\n" >> /home/vagrant/.bashrc
    chmod 744 /usr/local/bin/drush-create-site/rm-site.sh
    EOH
  end
  # force some settings to be as such by writing to the end of those files
  bash "last-minute-config-tweaks" do
    code <<-EOH
    cat /var/www/elmsln/docs/php.txt >> /etc/php5/apache2/php.ini
    cat /var/www/elmsln/docs/apc.txt >> /etc/php5/apache2/conf.d/apc.ini
    cat /var/www/elmsln/docs/my.txt >> /etc/php5/apache2/conf.d/mysql.ini
    cat /var/www/elmsln/docs/my.txt >> /etc/php5/apache2/conf.d/mysqli.ini
    apachectl -k restart
    EOH
  end
  # disable seckit as it can conflict needlessly in a vagrant instance
  bash "drush-disable-seckit" do
    code <<-EOH
    cd /var/www/elmsln/domains/online
    drush dis seckit --uri=online.elmsln.local --y
    EOH
  end
  # enable drush function for bakery integration OOTB
  bash "drush-vagrant-bakery" do
    code <<-EOH
    cd /var/www/elmsln/domains/online
    drush en vagrant_bakery --uri=online.elmsln.local --y
    EOH
  end
end
