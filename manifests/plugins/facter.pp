class mcollective::plugins::facter (
  $provider = 'package',
) {

  $packages = [ 'mcollective-facter-facts' ]

  $p_base = $mcollective::plugins::p_base
  $s_base = $mcollective::plugins::s_base

  case $provider {

    package : {
      package { $packages:
        ensure  => $::mcollective::params::mcollectivefacterversion,
        notify  => Service['mcollective'],
      }
    }

    file : {
      file { "${p_base}/facts/facter_facts.rb":
        source => "${s_base}/facts/facter/facter_facts.rb",
        notify => Service['mcollective'],
      }
    }

    default : {
      fail("${::hostname}: mcollective: package param only allows package or file")
    }

  }

}
