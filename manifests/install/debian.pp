class mcollective::install::debian {

  package { 'stomp':
    ensure   => present,
    name     => 'libstomp_ruby',
  }

  package { 'mcollective':
    ensure  => present,
    require => Package['stomp'],
  }
}

