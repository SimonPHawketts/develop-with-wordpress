#!/usr/bin/env sh

wp import --authors=create /var/www/import/site-content.wordpress.xml
wp import --authors=create /var/www/import/site-menu.xml