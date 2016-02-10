# Configure Nginx
class nginx::config(){

  file { '/etc/nginx/sites-enabled/default':
    ensure  => absent
  }

}
