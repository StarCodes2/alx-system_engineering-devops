# Increases the max amount of traffic an Nginx server can handle at any given time

exec { 'Update Nginx file':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/',
  notify  => Exec['restart-nginx'],
}

exec {'restart-nginx':
  command     => 'nginx restart',
  path        => '/etc/init.d/',
  refreshonly => true,
}