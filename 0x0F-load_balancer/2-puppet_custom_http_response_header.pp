# Install and configure Nginx so that its HTTP response comtains a custom header

$config_nginx = "server {
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
}"

exec { 'apt-get update':
  path   => '/usr/bin/:/usr/local/bin/:/bin/'
} ->

exec { 'apt-get install -y nginx':
  path   => '/usr/bin/:/usr/local/bin/:/bin/'
} ->

exec { 'mkdir -p /var/www/html':
  path   => '/usr/bin/:/usr/local/bin/:/bin/'
} ->

file { '/var/www/html/index.html':
  ensure  => 'present',
  content => 'Hello World!'
} ->

file { '/var/www/html/404.html':
  ensure  => 'present',
  content => "Ceci n'est pas une page"
} ->

exec { '/etc/nginx/sites-available/default':
  ensure  => 'present',
  content => $config_nginx
} ->

exec { 'nginx restart':
  path   => '/etc/init.d/'
}
