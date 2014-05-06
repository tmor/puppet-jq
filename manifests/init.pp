# == Class: jq
#
# Installs (or removes) the jq utility
#
# === Parameters
#
# [*ensure*]
#   present, absent
#
# [*source*]
#   The URL of the jq binary
#
# === Examples
#
#  include jq
#
# === Authors
#
# Rick Fletcher <fletch@pobox.com>
#
# === Copyright
#
# Copyright 2014 Rick Fletcher
#
class jq (
  $ensure = present,
  $source = 'http://stedolan.github.io/jq/download/linux64/jq',
) {
  if $ensure == 'present' {
    wget::fetch { $source:
      source      => $source,
      destination => '/usr/local/bin/jq',
      timeout     => 0,
      verbose     => false,
    }
  }

  file { '/usr/local/bin/jq':
    ensure => $ensure,
    mode   => '0755',
  }
}
