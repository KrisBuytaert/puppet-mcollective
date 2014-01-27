class mcollective::plugins::filemgr (
  $provider = 'package',
) {

  $packages = [ 'mcollective-filemgr-agent',
                'mcollective-filemgr-client',
                'mcollective-filemgr-common' ]

  $p_base = $mcollective::plugins::p_base
  $s_base = $mcollective::plugins::s_base

  case $provider {

    package : {
      package { $packages:
        ensure  =>  "${mcollective::params::mcollectivefilemgrversion}",
        require => Package['mcollective'],
        notify  => Service['mcollective'],
      }
    }

    file : {
      file { "${p_base}/agent/filemgr.rb":
        source => "${s_base}/agent/filemgr/agent/filemgr.rb",
        notify => Service['mcollective'],
      }
      file { "${p_base}/agent/filemgr.ddl":
        source => "${s_base}/agent/filemgr/agent/filemgr.ddl",
        notify => Service['mcollective'],
      }
    }

    default : {
      fail("${::hostname}: mcollective: package param only allows package or file")
    }

  }

}
