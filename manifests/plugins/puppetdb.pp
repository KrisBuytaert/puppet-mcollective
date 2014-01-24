class mcollective::plugins::puppetdb (
  $provider = 'package',
) {

  $packages = [ 'mcollective-puppetdb-discovery', ]

  $p_base = $mcollective::plugins::p_base
  $s_base = $mcollective::plugins::s_base

  case $provider {

    package : {
      package { $packages:
        ensure  =>  "${mcollective::params::mcollectivepuppetdbversion}",
        require => Package['mcollective'],
        notify  => Service['mcollective'],
      }
    }

    file : {
      file { "${p_base}/discovery/puppetdb.rb":
        source => "${s_base}/discovery/puppetdb/discovery/puppetdb.rb",
        notify => Service['mcollective'],
      }
      file { "${p_base}/discovery/puppetd.ddl":
        source => "${s_base}/discovery/puppetdb/discovery/puppetdb.ddl",
        notify => Service['mcollective'],
      }
      file { "${p_base}/util/puppetdb_discovery.rb":
        source => "${s_base}/discovery/puppetdb/util/puppetdb_discovery.rb",
        notify => Service['mcollective'],
      }
    }

    default : {
      fail("${::hostname}: mcollective: package param only allows package or file")
    }

  }

}
