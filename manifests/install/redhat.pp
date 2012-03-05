class mcollective::install::redhat {

  package { 'stomp':
    name   => 'rubygem-stomp',
    ensure => 'installed'
  }

  package { 'mcollective':
    ensure  => present,
    alias   => 'mcollective',
    require => Package['stomp'],
  }

}

