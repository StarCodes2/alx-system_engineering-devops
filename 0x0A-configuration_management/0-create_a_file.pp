#!/usr/bin/pup
file { '/tmp/school':
  ensure => 'file',
  owner  =>  'www-data',
  group  => 'www-data',
  mode   => '0744',
}

exec { 'file content':
  command => '/bin/echo "I love Puppet" > /tmp/school',
  require => File['/tmp/school'],
}
