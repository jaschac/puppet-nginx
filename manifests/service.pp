# Controls Nginx related servuces
class nginx::service(
  ) inherits ::nginx::params {
  
  # Disable Apache
  exec { 'disable_apache':
    command => $::osfamily ? {
      'Debian' => '/usr/sbin/service apache2 stop',
      default  => "${::osfamily} not supported.",
      }
  }

  # Restart Nginx
  exec { 'restart nginx':
    command => $::osfamily ? {
      'Debian' => '/usr/sbin/service nginx restart',
      default  => "${::osfamily} not supported.",
      }
    }

}
