#!/usr/bin/env sh

chown www-data:www-data /var/www/html -R

# Install Found Film Development WordPress.
wp core install \
  --title="Wordpress Development site" \
  --admin_user=admin \
  --admin_password="a-secret-admin-password" \
#  --admin_email="my.email@localhost" \
  --url=http://wordpress.localhost \
  --skip-email

chown www-data:www-data /var/www/html -R

# Activate plugin.
wp plugin activate myplugin
