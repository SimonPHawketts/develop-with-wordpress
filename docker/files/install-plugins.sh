#!/usr/bin/env bash

# Make sure the /var/www/html directory is owned by www-data
chown www-data:www-data /var/www/html -R

# Install plugins used on your site
# Either from the net
wp plugin install jetpack --activate
# Or from a file
wp plugin install /var/www/plugins/classic-editor.1.4.zip --activate
