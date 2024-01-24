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

exec { 'file structure':
  command => '/usr/bin/mkdir -p /var/www/ezekielogunewu.tech/html',
  require => Exec['install nginx'],
}

exec { 'change mode':
  command => '/usr/bin/chmod -R $USER:$USER /var/www/ezekielogunewu.tech/html',
  require => Exec['file structure'],
}

exec { 'change mode2':
  command => '/usr/bin/chmod -R 755 /var/www',
  require => Exec['change mode'],
}

exec { 'index':
  command => '/bin/echo "Hello World!" > /var/www/ezekielogunewu.tech/html/index.html',
  require => Exec['change mode2'],
}

exec { 'config':
  command => |
  'printf %s "server {
	listen 80 default_server;
	listen [::]:80 default_server;
	root /var/www/ezekielogunewu.tech/html;
	index index.html index.htm;

	server_name ezekielogunewu.tech;

	location /redirect_me {
		return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
	}

	location / {
		try_files $uri $uri/ =404;
	}
}" > /etc/nginx/sites-available/default',
  notify  => Service['nginx'],
  require => Exec['install nginx'],
}

service { 'nginx':
  ensure => running,
  enable => true,
}
