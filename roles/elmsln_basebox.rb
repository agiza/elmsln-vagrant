name "elmsln_dev"
description "A base box, set in motion for ELMSLN development but not installed. Everything up to the install script being run and clean up."
run_list(
  "role[apache2_mod_php]",
  "role[drupal]",
  "role[drupal_dev]",
  "role[memcached]",
  "role[mysql_server]",
  "recipe[drupal::multisite]",
  "recipe[elmsln::default]",
  "recipe[elmsln-config-vagrant::default]",
  "recipe[elmsln-config-vagrant::piwik-install]"
)
