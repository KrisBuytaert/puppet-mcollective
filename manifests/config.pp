class mcollective::config {

  case $::operatingsystem {
    debian,ubuntu: { $libdir = '/usr/share/mcollective/plugins' }
    redhat,centos: { $libdir = '/usr/libexec/mcollective' }
    default: { fail("${::hostname}: trying to configure on a unsupported operatingsystem: ${::operatingsystem}") }
  }

  File {
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Class['mcollective::install'],
  }

  file { '/etc/mcollective':
    ensure => 'directory',
    mode   => '0750',
  }

  file { '/etc/mcollective/server.cfg':
    content => template('mcollective/server.cfg.erb'),
    notify  => Service['mcollective'],
  }


  # Disabling Fact updates as they are generated from facter using cron
  # file { "/etc/mcollective/facts.yaml":
  #  content => template("mcollective/facts.yaml.erb")
  #}

  @file { '/etc/nagios/nrpe_conf.d/mcollective_touch_check.cfg':
    ensure => absent,
    tag    => 'nagios_nrpe_check',
  }

  #@nagios::nrpe_command { "check_mcollective_touch":
  #  command    => "check_file_age",
  #  parameters => "-w 600 -c 1200 /var/run/mcollective.plugin.filemgr.touch",
  #  cplugdir   => 'system'
  #}
}
