#!/usr/bin/pup
exec { 'terminates process killmenow':
  command => '/bin/pkill -f killmenow',
}
