MCollective Puppet module     Christophe Vanlancker <carroarmato0@inuits.eu>
-------------------------

This module is a rewrite of the following Puppet Module at https://github.com/mikepea/puppet-module-mcollective  by  mikepea (which hasn't been modified in 3 years as of 03/04/2013).

The plugins which are being used come from ripienaar his repo https://github.com/ripienaar/mcollective-plugins   (last pull 03/04/2013)


How To
-------------------------

# Install the mcollective daemon (stomp is the default)
class{'::mcollective':
  stomp_host      => '192.168.100.10',
  stomp_port      => '6163',
  collectives     => 'test',
  main_collective => 'test',
  connector       => 'stomp',
}

# Include the mcollective client with basic plugins
include ::mcollective::client

# You can pick the plugins you want by including them 
# (default is through the package)
include ::mcollective::plugins::package
include ::mcollective::plugins::service
include ::mcollective::plugins::nrpe
include ::mcollective::plugins::puppet
include ::mcollective::plugins::filemgr

# If your distribution doesn't have packages for the plugin 
# you want to use, you can use a parameter which will install 
# the plugin files manually. (not recommended though)
class {'mcollective::plugins::package' :
	provider => 'file',
}
