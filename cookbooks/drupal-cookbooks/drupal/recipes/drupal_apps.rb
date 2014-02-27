# Automatically prepare vhosts for drupal sites.
require_recipe "hosts"
require_recipe "apache2"

if node[:hosts].has_key(:localhost_aliases)
  node[:hosts][:localhost_aliases].each do |site|
    # Configure the development site
    stack = site.split('.').first
    stackaddy = stack + '.elmsln'
    web_app site do
      template "sites.conf.erb"
      server_name stackaddy
      server_aliases [stackaddy]
      docroot "#{node[:www_root]}/{stack}"
    end
  end
end
