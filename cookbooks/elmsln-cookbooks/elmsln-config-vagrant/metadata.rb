maintainer       "Bryan Ollendyke"
maintainer_email "bto108@psu.edu"
license          "GPL 2.0"
description      "Installs ELMSLN vagrant config repo"
version          "1.0.0"
#depends           "php::pear"
#depends           "php::php5"
recipe "elmsln-config-vagrant", "Installs ELMSLN vagrant config repo"

%w{ debian ubuntu arch }.each do |os|
  supports os
end
