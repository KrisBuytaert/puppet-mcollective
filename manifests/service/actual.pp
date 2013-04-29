class mcollective::service::actual {

  class {'mcollective::install': } ->
  class {'mcollective::plugins': } ->
  class {'mcollective::config': } ->
  service { 'mcollective':
    ensure     => 'running',
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
