!/bin/bash

service mysql start
mariadb < /var/www/phpmyadmin/sql/tmp.sql
service php7.3-fpm start
service nginx start

echo "***** Server successfully started! *****"
bash