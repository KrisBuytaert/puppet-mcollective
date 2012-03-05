class mcollective::install::redhat {

  package { 'stomp':
    ensure => 'installed',
    name   => 'rubygem-stomp',
  }

  package { 'mcollective':
    ensure  => 'present',
    alias   => 'mcollective',
    require => Package['stomp'],
  }

}

