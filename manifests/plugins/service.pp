class mcollective::plugins::service (
  $provider = 'package',
) {

  $packages = [ 'mcollective-service-agent',
                'mcollective-service-client',
                'mcollective-service-common' ]

  $p_base = $mcollective::plugins::p_base
  $s_base = $mcollective::plugins::s_base

  case $provider {

    package : {
      package { $packages:
        ensure  => 'latest',
        require => Package['mcollective'],
        notify  => Service['mcollective'],
      }
    }

    file : {
      file { "${p_base}/agent/service.rb":
        source => "${s_base}/agent/service/agent/service.rb",
        notify => Service['mcollective'],
      }
      file { "${p_base}/agent/service.ddl":
        source => "${s_base}/agent/service/agent/service.ddl",
        notify => Service['mcollective'],
      }
      file { "${p_base}/application/service.rb":
        source => "${s_base}/agent/service/application/service.rb",
        notify => Service['mcollective'],
      }
    }

    default : {
      fail("${::hostname}: mcollective: package param only allows package or file")
    }

  }

}
