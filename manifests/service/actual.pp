class mcollective::service::actual {

  class {'mcollective::install': } ->
  class {'mcollective::config': } ->
  class {'mcollective::plugins': } ->
  service { 'mcollective':
    ensure     => 'running',
    hasstatus  => true,
    hasrestart => true,
  }
}

