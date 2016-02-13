# lostinmalloc-nginx
#### Table of Contents
1. [Overview](#overview)
2. [Module Description](#module-description)
    * [What lostinmalloc-nginx does](#what-lostinmalloc-nginx-does)
    * [What lostinmalloc-nginx does not](#what-lostinmalloc-nginx-does-not)
3. [Setup](#setup)
    * [Requirements](#requirements)
4. [Usage](#usage)
5. [Reference](#reference)
6. [Limitations](#limitations)
7. [Contact](#contact)

## Overview
The `lostinmalloc-nginx` module manages the Nginx web server. It does take care of its configuration and deployment on a node. Make sure to check the [official webpage](http://nginx.org/) should you have any doubts about Nginx. 

`lostinmalloc-nginx` is distributed through the **Apache License 2.0**. Please do refer to the [LICENSE](https://github.com/jaschac/puppet-nginx/blob/master/LICENSE) for details.

## Module Description
The `lostinmalloc-nginx` module allows the client to install, configure and manage the Nginx web server. The package, `nginx-full`, is installed through the default package management tool, which is APT in the case of Linux Debian and its derivative. The client can configure several of its properties, so that it meets the needs of any specific node.

Note that, on the contrary of Apache, Nginx needs to be compiled from the source, should we need to add modules. The `lostinmalloc-nginx` module does not allow this, since it relies on the version available through the default packages provider of the system.

Despite this, should the client ever need to install additional dependencies, apart those required by Nginx itself, he can do so by specifying them as `extra_dependencies`. The `lostinmalloc-nginx` module will take care to install them. See the [Reference](#reference) for more details.

### What lostinmalloc-nginx does
The `lostinmalloc-nginx` module is responsible of:

  - Installing Nginx. More specifically, it does install `nginx-full`.
  - Customizing the Nginx configuration.
  - Making sure that Apache is turned off, if present.

### What lostinmalloc-nginx does not
The `lostinmalloc-nginx` module is **not**  responsible of:

  - Providing virtual host configuration files. The client is responsible of placing them in the default `/etc/nginx/sites-enabled/` directory.
  - Making sure any virtual host being server is properly configured.
  - Taking down the `default` virtual host installed with Nginx as an example. This is defined in `/etc/nginx/sites-available/default` and is soft linked into `/etc/nginx/sites-enabled/`.

## Setup
In order to install `lostinmalloc-nginx`, run the following command:
```bash
$ sudo puppet module install lostinmalloc-nginx
```
Once installed, creating an instance of `lostinmalloc-nginx` on a node is a simple as:
```bash
node 'puppet.lostinmalloc.com' {
  class { 'nginx': }
}
```
The module does expect all the data to be provided through 'Hiera'. See [Usage](#usage) for examples on how to configure it.

#### Requirements
In terms of **requirements** `lostinmalloc-nginx` demands:

  - `puppet >=4.0.0`

## Usage
As aforementioned, `lostinmalloc-nginx` expects all the data to be provided through `Hiera`. In the example below, we are going to set the following:

  - We are installing an extra dependency, `cmatrix`, through APT.
  - We are customizing Nginx so that:
    - It will accept upload files up to 15 MB.
    - Will store the pid in `/var/run/nginx.pid`.
    - Will be executed as the `www-data` user.
    - Will have 8 workers.
    - Each worker will handle up to 768 connections.

```bash
---
nginx::params::extra_dependencies:
  cmatrix: 'apt'
nginx::params::config:
  client_max_body_size: '15M'
  pid: '/var/run/nginx.pid'
  user: 'www-data'
  worker_connections: '768'
  worker_processes: '8'
```

## Reference
Attributes written *in italic*, are optional:

  - `extra_dependencies`: a hash representing extra dependencies that the client wants to install. The information must be provided in the form package_name : provider. lostinmalloc-nginx takes care to merge both the mandatory and the extra dependencies into a unique hash and install any of the dependencies that are currently not present.


## Limitations
`lostinmalloc-nginx` has been developed and tested on the following setup(s):

  - Operating Systems:
    - Debian 7 Wheezy (3.2.68-1+deb7u3 x86_64)
    - Debian 8 Jessie (3.16.7-ckt11-1+deb8u3 x86_64)
  - Puppet
    - 4.2.1
  - Hiera
    - 3.0.1
  - Facter
    - 2.4.4
  - Ruby
    - 2.1.6p336

## Contact
You can contact me through:

  - The [GitHub page](https://github.com/jaschac/puppet-nginx) of `lostinmalloc-nginx`.
  - [Linkedin](https://es.linkedin.com/in/jaschacasadio).

Please feel free to report any bug and suggest new features/improvements.

