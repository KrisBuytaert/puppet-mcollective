class mcollective::params {

  case $operatingsystem {
      'RedHat', 'CentOS': {

        case $lsbmajdistrelease {
          '5':      {
            $mcollectiveversion        = '2.2.4-1.el5'
            $mcollectivecommonversion  = '2.2.4-1.el5'
          }
          '6':      {
            $mcollectiveversion        = '2.2.4-1.el6'
            $mcollectivecommonversion  = '2.2.4-1.el6'
          }
          default:  {
            $mcollectiveversion        = '2.2.4-1.el6'
            $mcollectivecommonversion  = '2.2.4-1.el6'
          }
        }
      }
      default:            {
        $mcollectiveversion            = '2.2.4-1'
        $mcollectivecommonversion      = '2.2.4-1'
      }
  }

  $mcollectivefacterversion     = '1.0.0-1'
  $mcollectivefilemgrversion    = '1.0.1-1'
  $mcollectivepackageversion    = '4.2.0-1'
  $mcollectivenrpeversion       = '3.0.2-1'
  $mcollectivepuppetdbversion   = '1.1-1'
  $mcollectivepuppetversion     = '1.6.0-1'
  $mcollectiveserviceversion    = '3.1.2-1'
}
