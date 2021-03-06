# == Class: bind::params
#
# Parameter class for bind module
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Examples
#
# class bind inherits bind::params { }
#
# === Authors
#
# Andrew Leonard
#
# === Copyright
#
# Copyright 2012 Andrew Leonard
#
class bind::params {

  case $::operatingsystem {
    ubuntu: {
      $group = 'bind'
      $options_file = '/etc/bind/named.conf.options'
      $pkgs = { 'bind9' => undef }
      $provider = 'apt'
      $svc = 'bind9'
      $wget = '/usr/bin/wget'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
