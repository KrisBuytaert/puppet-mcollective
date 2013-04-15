class mcollective::plugins::package (
  $provider = 'package',
) {

  $packages = [ 'mcollective-package-agent',
                'mcollective-package-client',
                'mcollective-package-common' ]

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
      file { "${p_base}/agent/package.rb":
        source => "${s_base}/agent/package/agent/package.rb",
        notify => Service['mcollective'],
      }
      file { "${p_base}/agent/package.ddl":
        source => "${s_base}/agent/package/agent/package.ddl",
        notify => Service['mcollective'],
      }
      file { "${p_base}/application/package.rb":
        source => "${s_base}/agent/package/application/package.rb",
        notify => Service['mcollective'],
      }
    }

    default : {
      fail("${::hostname}: mcollective: package param only allows package or file")
    }

  }

}
