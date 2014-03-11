name "elmsln_subbox"
description "Do git checkouts for latest versions of code, this is for use with the elms-vagrant.box prebuilt environment."
run_list(
  "recipe[elmsln::default]",
  "recipe[elmsln-config-vagrant::default]"
)
