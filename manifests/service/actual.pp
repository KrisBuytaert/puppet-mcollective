class mcollective::service::actual {

  include mcollective::install
  include mcollective::config
  include mcollective::plugins

  service { "mcollective":
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    require => Class["mcollective::install"],
  }
}

