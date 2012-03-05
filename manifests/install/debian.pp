class mcollective::install::debian {

  package { 'stomp':
    provider => 'gem',
    ensure   => '1.1',
  }

  package { 'mcollective':
    ensure  => present,
    alias   => 'mcollective',
    require => Package['stomp'],
  }
}

