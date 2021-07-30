service nginx start
service mysql start
service php7.3-fpm start

database_name='wordpress'
user='admin'
password='admin'
hostname='localhost'

echo  "CREATE DATABASE $database_name;" | mysql -u root
echo  "CREATE USER $user@'localhost' IDENTIFIED BY '$password';" | mysql -u root
echo  "GRANT ALL PRIVILEGES ON $database_name.* TO '$user'@'$hostname' WITH GRANT OPTION;" | mysql -u root
echo  "UPDATE mysql.user SET plugin='mysql_native_password' WHERE user='$user';" | mysql -u root
echo  "FLUSH PRIVILEGES;" | mysql -u root
echo < /var/www/ft_server/phpmyadmin/sql/create_tables.sql | mysql -u root

bash