#!/bin/sh

sleep 15

wp core download --path='/var/www/wordpress'

wp config create --dbname="$MYSQL_DATABASE" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --dbhost="$MYSQL_CONTAINER_NAME:$MYSQL_PORT" --dbprefix="wp_" --path='/var/www/wordpress'

wp core install --url=https://$DOMAIN_NAME:$WORDPRESS_PORT --title='Wordpress site' --admin_user='gkarina' --admin_password='admin_password' --admin_email='gkarina@student.21-school.ru' --skip-email --path='/var/www/wordpress'

wp user create boykonet boikosvet@yandex.ru --role='editor' --user_pass='user_password' --display_name='Svetlana Mikhaylenko' --nickname='boykonet' --first_name='Svetlana' --last_name='Mikhaylenko' --path='/var/www/wordpress'

wp theme activate twentytwenty --path='/var/www/wordpress'

php-fpm7 --nodaemonize