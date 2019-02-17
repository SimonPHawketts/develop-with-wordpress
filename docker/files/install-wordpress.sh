#!/usr/bin/env sh

chown www-data:www-data /var/www/html -R

# Install Found Film Development WordPress.
wp core install \
  --title="Wordpress Development site" \
  --admin_user=admin \
  --admin_password="a-secret-admin-password" \
  --admin_email="simon@develop-with-wordpress.co.uk" \
  --url=http://wordpress.localhost \
  --skip-email

chown www-data:www-data /var/www/html -R

# Activate plugin.
wp plugin activate myplugin
