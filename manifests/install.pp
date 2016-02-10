# Install Nginx and its dependencies
class nginx::install
  (
  ) inherits ::nginx::params {
    
    $basic_packages = {
      nginx-full => 'apt',
    }

    $mandatory_dependencies = empty($::nginx::mandatory_dependencies) ? {
      false => $::nginx::mandatory_dependencies,
      true  => {},
    }
  
    $extra_dependencies = empty($::nginx::extra_dependencies) ? {
      false => $::nginx::extra_dependencies,
      true  => {},
    }

  $packages_to_install = merge($basic_packages, $mandatory_dependencies, $extra_dependencies)

  if !empty($packages_to_install) {
    $packages_to_install.each |$package, $provider| {
      if !defined(Package[$package]) {
        Package{ $package:
          ensure   => present,
          provider => $provider,
          tag      => 'nginx'
          }
        }
      }
    }

  }
