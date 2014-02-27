# What
VirtualBox Vagrant Chef Drupal ELMSLN install

# How
1. Download and Install [VirtualBox](http://www.virtualbox.org/) (ensure you are on the latest version 4.0.8+)
2. Install [vagrant](http://vagrantup.com/v1/docs/getting-started/index.html)
3. Download or Clone this project go to the folder and launch the box:
    `cd [vagrant project directory];
    vagrant up`
4. Add this line to your /etc/hosts (or windows equivalent):
`
10.0.0.10       courses.elmsln

10.0.0.11       media.elmsln

10.0.0.12       online.elmsln

10.0.0.13       analytics.elmsln

10.0.0.14       studio.elmsln

10.0.0.15       interact.elmsln
`

Now you'll be able to jump into any of the domains that ELMSLN starts to establish for use!  Go to http://online.elmsln/ to get started, though if everything went well you'll be presented with a new drupal site running the CIS distribution.

To connect to the console of you instance:
    `vagrant ssh`

# Why
This project is based on the [Vagrant Project](http://drupal.org/project/vagrant) on Drupal.org, but includes a number of tweaks.

1. Instead of provisioning a Drupal site using Chef, it simply sets up Apache to serve incoming requests from the shared Vagrant public directory. It assumes that you'll be maintaining one VM for each simulated multisite instance.
2. It doesn't install PHPMyadmin, because that makes baby Jesus cry. If you need to poke at the DB, use a tool like [Sequel Pro](http://www.sequelpro.com/), and log into the DB over the Vagrant SSH connection.
3. It installs Drush 5.7 via PEAR instead of a custom Chef recipe. Because lazy.

--------

You can add `XDEBUG_PROFILE` to your GET parameter to generate an xdebug profile, e.g. [http://online.elmsln/?XDEBUG_PROFILE](http://dev-site.vbox.local/?XDEBUG_PROFILE)


## Other projects of interest

*  [https://github.com/msonnabaum/drupalcon-training-chef-repo](https://github.com/msonnabaum/drupalcon-training-chef-repo)
*  [http://drupal.org/sandbox/mbutcher/1356522](http://drupal.org/sandbox/mbutcher/1356522)
*  [http://drupal.org/project/drush-vagrant](http://drupal.org/project/drush-vagrant)
