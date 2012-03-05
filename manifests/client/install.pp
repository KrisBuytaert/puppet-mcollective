# = Class: mcollective::client::install
#
# Installs packages
#
# == Actions:
#
# Installs the mcollective-client package.
#
class mcollective::client::install {
  package { 'mcollective-client': ensure => 'present' }
}

