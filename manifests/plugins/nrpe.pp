class mcollective::plugins::nrpe (
  $provider = 'package',
) {

  $packages = [ 'mcollective-nrpe-agent',
                'mcollective-nrpe-client',
                'mcollective-nrpe-common' ]

  $p_base = $mcollective::plugins::p_base
  $s_base = $mcollective::plugins::s_base

  case $provider {

    package : {
      package { $packages:
        ensure  => $::mcollective::params::mcollectivenrpeversion,
        require => Package['mcollective'],
        notify  => Service['mcollective'],
      }
    }

    file : {
      file { "${p_base}/agent/nrpe.rb":
        source => "${s_base}/agent/nrpe/agent/nrpe.rb",
        notify => Service['mcollective'],
      }
      file { "${p_base}/agent/nrpe.ddl":
        source => "${s_base}/agent/nrpe/agent/nrpe.ddl",
        notify => Service['mcollective'],
      }
    }

    default : {
      fail("${::hostname}: mcollective: package param only allows package or file")
    }

  }

}
