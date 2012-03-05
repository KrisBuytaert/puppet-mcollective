# = Class: mcollective::client
#
# Installs the mcollective client (if supported)
#
class mcollective::client {
  case $::operatingsystem {
    ubuntu,debian,redhat,centos: { include mcollective::client::actual }
    default: { notice("${::hostname}: mcollective: module does not yet support ${::operatingsystem}") }
  }
}
