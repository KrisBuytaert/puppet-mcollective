class mcollective::install::debian {

  package { 'libstomp-ruby':
    ensure   => installed,
    alias    => 'stomp',
  }

  package { 'mcollective':
    ensure  => installed,
    alias   => 'mcollective',
    require => Package['stomp'],
  }
}

