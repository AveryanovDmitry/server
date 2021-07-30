FROM debian:buster


RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install wget
RUN apt-get -y install nginx 
RUN apt-get -y install mariadb-server
RUN apt-get -y install php7.3 php-mysql php-fpm php-gd php-mbstring php-zip
RUN apt-get -y install vim

WORKDIR /etc/nginx/sites-available/
COPY ./srcs/nginx.conf /etc/nginx/sites-available/nginx.conf
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled

WORKDIR /var/www/ft_server
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages/ /var/www/ft_server/phpmyadmin
COPY ./srcs/config.inc.php /var/www/ft_server/phpmyadmin

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm -rf latest.tar.gz
RUN chown -R www-data:www-data /var/www/ft_server/wordpress
WORKDIR /var/www/ft_server/wordpress
COPY ./srcs/wp-config.php .

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt  -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=21School/CN=localhost"

COPY ./srcs/starts.sh ./
CMD bash ./starts.sh