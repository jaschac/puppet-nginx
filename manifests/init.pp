# Defines an Nginx instance
class nginx
  (
  ) inherits ::nginx::params {
    contain ::nginx::install
    contain ::nginx::config
    contain ::nginx::service
  }
