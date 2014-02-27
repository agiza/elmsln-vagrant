name "elmsln_dev"
description "A fully configured ELMSLN instance for testing and development."
run_list(
  "recipe[elmsln]",
  "recipe[elmsln-config-vagrant]",
  "role[apache2_mod_php]",
  "role[drupal]",
  "role[drupal_dev]",
  "role[memcached]",
  "role[mysql_server]",
  "recipe[drupal::multisite]"
)