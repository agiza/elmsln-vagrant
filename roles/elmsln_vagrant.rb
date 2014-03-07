name "elmsln_vagrant"
description "ELMSLN running on Vagrant for our instance."
run_list(
  "recipe[elmsln::default]",
  "recipe[elmsln-config-vagrant::default]",
  "recipe[elmsln-config-vagrant::drush-aliases]",
  "recipe[elmsln::install]",
  "recipe[elmsln-config-vagrant::piwik-install]",
  "recipe[elmsln-config-vagrant::vagrant-install]"
)
