# = Class: mcollective::client::config
#
# Description of mcollective::client::config
#
class mcollective::client::config {

  $group = $mcollective::client_group ? {
    ''      => 'root',
    default => $mcollective::client_group,
  }

  file { '/etc/mcollective/client.cfg':
    content => template('mcollective/client.cfg.erb'),
    mode    => '0640',
    owner   => 'root',
    group   => $group,
    require => Class['mcollective::client::install']
  }

}

