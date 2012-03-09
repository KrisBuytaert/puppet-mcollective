class mcollective::install::debian {

  package { 'stompserver':
    ensure   => 'present',
  }

  package { 'mcollective':
    ensure  => present,
    alias   => 'mcollective',
    require => Package['stompserver'],
  }
}

