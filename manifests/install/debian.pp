class mcollective::install::debian {

  package { 'libstomp-ruby':
    ensure   => installed,
    alias    => 'stomp',
  }

  package { 'mcollective':
    ensure  => present,
    alias   => 'mcollective',
    require => Package['stomp'],
  }
}

