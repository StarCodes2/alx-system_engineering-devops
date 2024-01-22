#!/usr/bin/pup
file { '~/.ssh/config':
  ensure => 'file',
  owner  => 'root',
  group  => 'root',
  mode   => '0600',
}

exec { 'first line':
  command => '/bin/echo "Host *" > ~/.ssh/config',
  require => File['~/.ssh/config'],
}

exec { 'second line':
  command => '/bin/echo "    IdentityFile ~/.ssh/school" >> ~/.ssh/config',
  require => Exec['first line'],
}

exec { 'third line':
  command => '/bin/echo "    PasswordAuthentication no" >> ~/.ssh/config',
  require => Exec['second line'],
}
