#!/usr/bin/pup
# Install and configure Nginx so that its HTTP response comtains a custom header
exec { 'update':
  command => '/usr/bin/apt-get update',
}

exec { 'install':
  command => '/usr/bin/apt-get install -y nginx',
  require => Exec['update'],
}

exec { 'create dir':
  command => '/usr/bin/mkdir -p /var/www/html',
  require => 'Exec[install'],
}

exec { 'index':
  command => 'echo "Hello World!" > /var/www/html/index.html',
  require => Exec['create dir'],
}

exec { '404':
  command => "/usr/bin/echo 'Ceci n'est pas une page' > /var/www/html/404.html",
  require => Exec['create dir'],
}
exec { 'config':
  command => |
"/usr/bin/printf %s \"server {
	listen 80 default_server;
	listen [::]:80 default_server;
	root /var/www/html;
	index index.html index.htm;
	add_header X-Served-By ${HOSTNAME};

	location /redirect_me {
		return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
	}

	error_page 404 /404.html;
	location /404 {
		root /var/www/html;
		internal;
	}
}
\" > /etc/nginx/sites-available/default",
  require => Exec['404'],
}

exec { 'restart':
  command => 'service nginx restart',
  require => Exec['config'],
}
