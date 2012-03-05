class mcollective(
  $psk            = 'unset',
  $stomp_user     = 'guest',
  $stomp_password = 'guest',
  $stomp_host     = 'puppetmaster',
  $stomp_port     = '6163',
  $factsource     = 'facter'
){
  include mcollective::service
}
