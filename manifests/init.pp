class mcollective(
  $psk             = unset,
  $stomp_user      = 'guest',
  $stomp_password  = 'guest',
  $stomp_host      = 'puppetmaster',
  $stomp_port      = '61613',
  $factsource      = 'facter',
  $collectives     = unset,
  $main_collective = unset,
){
  include mcollective::service
}
