class mcollective(
  $psk                      = unset,
  $stomp_user               = 'guest',
  $stomp_password           = 'guest',
  $stomp_host               = 'puppetmaster',
  $stomp_port               = '61613',
  $factsource               = 'facter',
  $collectives              = unset,
  $main_collective          = unset,
  $connector                = 'stomp',
  $direct_addressing        = false,
  $default_discovery_method = 'mc',
  $puppetdb_host            = unset,
  $puppetdb_port            = '8080',
){
  include mcollective::service

  if $factsource == 'facter' {
    include mcollective::plugins::facter
  }

  case $direct_addressing {
    true: { $use_direct_addressing = '1' }
    default: { $use_direct_addressing = '0' }
  }

  case $connector {
    /(stomp|rabbitmq)/ : { }
    default            : { fail('Connector must be either stomp or rabbitmq!') }
  }
}
