class mcollective::plugins {

  case $::operatingsystem {
    debian,ubuntu: { $p_base = '/usr/share/mcollective/plugins/mcollective' }
    redhat,centos: { $p_base = '/usr/libexec/mcollective/mcollective' }
    default: { fail("${::hostname}: mcollective: trying to install unsupported operatingsystem ${::operatingsystem}") }
  }

  $s_base = 'puppet:///modules/mcollective/plugins'

  File {
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['mcollective'],
    notify  => Service['mcollective'],
  }
}
