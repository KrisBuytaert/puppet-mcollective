class mcollective::plugins::puppet (
  $provider = 'package',
) {

  $packages = [ 'mcollective-puppet-agent',
                'mcollective-puppet-client',
                'mcollective-puppet-common' ]

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
      file { "${p_base}/agent/puppetd.rb":
        source => "${s_base}/agent/puppetd/agent/puppetd.rb",
        notify => Service['mcollective'],
      }
      file { "${p_base}/agent/puppetd.ddl":
        source => "${s_base}/agent/puppetd/agent/puppetd.ddl",
        notify => Service['mcollective'],
      }
      file { "${p_base}/application/puppetd.rb":
        source => "${s_base}/agent/puppetd/application/puppetd.rb",
        notify => Service['mcollective'],
      }
    }

    default : {
      fail("${::hostname}: mcollective: package param only allows package or file")
    }

  }

}
