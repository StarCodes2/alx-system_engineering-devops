#!/usr/bin/pup
exec { 'append to /etc/ssh/ssh_config':
  command => '/bin/echo "Host *\n    IdentityFile ~/.ssh/school\n    PasswordAuthentication no\n" >> /etc/ssh/ssh_config',
}
