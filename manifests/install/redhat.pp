class mcollective::install::redhat {
  include mcollective::params

  package { 'stomp':
    ensure => 'installed',
    name   => 'rubygem-stomp',
  }

  package { 'mcollective-common':
    ensure  => $::mcollective::params::mcollectivecommonversion,
  }

  package { 'mcollective':
    ensure  => $::mcollective::params::mcollectiveversion,
    alias   => 'mcollective',
    require => Package['stomp'],
  }

  Package['mcollective-common'] -> Package['mcollective']
}
