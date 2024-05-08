# Fix the bad 'phpp' extension to php in the file `wp-settings.php

exec { 'wordpress-fix':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => '/usr/local/bin/:/bin/'
}