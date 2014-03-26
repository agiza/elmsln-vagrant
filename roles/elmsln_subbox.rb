name "elmsln_subbox"
description "Do git checkouts for latest versions of code, this is for use with the elms-vagrant.box prebuilt base environment. Then run the installer."
run_list(
  "recipe[elmsln-config-vagrant::vagrant-performance]",
  "recipe[elmsln::repo]",
  "recipe[elmsln-config-vagrant::default]",
  "recipe[elmsln-config-vagrant::vagrant-chown]",
  "recipe[elmsln-config-vagrant::drush-aliases]",
  "recipe[elmsln::install]",
  "recipe[elmsln-config-vagrant::piwik-directories]",
  "recipe[elmsln-config-vagrant::vagrant-install]"
)
