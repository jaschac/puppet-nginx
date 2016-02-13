# Configure Nginx
class nginx::config
  (
  ){

    file { '/etc/nginx/sites-enabled/default':
      ensure  => absent
    }

    file { '/etc/nginx/nginx.conf':
      ensure  => file,
      content => epp(
        'nginx/nginx.conf',
        {'config' => $::nginx::config}
      )
    }

  }
