ELMSLN Vagrant package
==============
[Watch how to use this!](https://www.youtube.com/watch?v=ZeuDKzs6sj0&list=PLJQupiji7J5fygec37Wd-gAbpMj8c5A_C)
###What is this
This is a Vagrant profile for installing a fully functioning [ELMS Learning Network](https://github.com/btopro/elmsln) in a single command!  This instance is purely for development purposes but you can follow the [installation instructions](https://github.com/btopro/elmsln/blob/master/INSTALL.txt) and bash scripts to install this on any real server!

###How to use this to bring up ELMSLN
1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) (ensure you are on the latest version 4.0.8+)
2. Install [Vagrant](http://www.vagrantup.com/downloads.html) (you'll need Vagrant 1.5+ so that it supports VagrantCloud)
3. Install [git](http://git-scm.com/downloads) (recommended)
4. Download or Clone (`git clone https://github.com/btopro/elmsln-vagrant.git`) this project
5. Add this line to your /etc/hosts (or [windows equivalent](http://www.howtogeek.com/howto/27350/beginner-geek-how-to-edit-your-hosts-file/)) so you can access it "over the web":

```
###ELMSLN development

# front facing addresses
10.0.0.10       courses.elmsln.local
10.0.0.11       media.elmsln.local
10.0.0.12       online.elmsln.local
10.0.0.13       analytics.elmsln.local
10.0.0.14       studio.elmsln.local
10.0.0.15       interact.elmsln.local
10.0.0.16       blog.elmsln.local

# backend webservices addresses
10.0.0.10       data.courses.elmsln.local
10.0.0.11       data.media.elmsln.local
10.0.0.12       data.online.elmsln.local
10.0.0.14       data.studio.elmsln.local
10.0.0.15       data.interact.elmsln.local
10.0.0.16       blog.elmsln.local
```

###Spin up the vagrant instance
```
cd elmsln-vagrant
vagrant up
```

Now you'll be able to jump into any of the domains that ELMSLN starts to establish for use!  Go to http://online.elmsln.local/ after installation completes (grab a coffee, it takes awhile the first time to finish).  If it all worked you should see a new Drupal site running the Course Information System (CIS) distribution.

You can log into this with `user: admin | password: admin`

To connect to the console of your instance: `vagrant ssh`

###Why use this

This project is based on the [Vagrant Project](http://drupal.org/project/vagrant) on Drupal.org, but includes a number of tweaks.  It has been optimized and heavily tested for use with ELMS Learning Network.  It's what [@btopro](http://twitter.com/btopro) uses in daily testing and development and the drop dead easiest way to get up and running with such a complex system.

###Other projects of interest / that this is based on

*  [https://github.com/msonnabaum/drupalcon-training-chef-repo](https://github.com/msonnabaum/drupalcon-training-chef-repo)
*  [http://drupal.org/sandbox/mbutcher/1356522](http://drupal.org/sandbox/mbutcher/1356522)
*  [http://drupal.org/project/drush-vagrant](http://drupal.org/project/drush-vagrant)
