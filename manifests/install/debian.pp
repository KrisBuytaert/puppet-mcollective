class mcollective::install::debian {

  package { 'stomp':
    ensure   => '1.1',
    provider => 'gem',
  }

  package { 'mcollective':
    ensure  => present,
    alias   => 'mcollective',
    require => Package['stomp'],
  }
}

