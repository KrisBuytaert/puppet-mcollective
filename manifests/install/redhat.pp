class mcollective::install::redhat {

  package { 'stomp':
    ensure => 'installed',
    name   => 'rubygem-stomp',
  }

  package { 'mcollective':
    ensure  => $::mcollective::params::mcollectiveversion,
    alias   => 'mcollective',
    require => Package['stomp'],
  }

  package { 'mcollective-common':
    ensure  => $::mcollective::params::mcollectivecommonversion,
    require => Package['mcollective'],
  }

}

