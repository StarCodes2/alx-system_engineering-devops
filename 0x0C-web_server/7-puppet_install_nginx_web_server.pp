#!/usr/bin/pup
# Install Nginx, configure it to listen on port 80 and returns a page
# containing the string 'Hello World!' when queried with curl and redirect
# /redirect_me to another page
exec { 'apt-get update':
  command => '/usr/bin/apt-get update',
}

exec { 'install nginx':
  command => '/usr/bin/apt-get -y install nginx',
  require => Exec['apt-get update'],
}

file { '/etc/nginx/html':
  ensure  => 'directory',
  owner   => 'root',
  group   => 'root',
  mode    => '0755',
  require => Exec['install nginx'],
}

exec { 'index':
  command => '/bin/echo "Hello World!" > /etc/nginx/html/index.html',
  require => File['/etc/nginx/html'],
}

file { '/etc/nginx/sites-available/default':
  ensure  => 'file',
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => |
"server {
	listen	80 default_server;
	listen	[::]:80 default_server;
	root	/etc/nginx/html;
	index	index.html index.htm;

	location /redirect_me {
		return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
	}
}",
  notify  => Service['nginx'],
  require => Exec['install nginx'],
}

service { 'nginx':
  ensure => running,
  enable => true,
}
