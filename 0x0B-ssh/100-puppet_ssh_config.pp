#!/usr/bin/pup
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
