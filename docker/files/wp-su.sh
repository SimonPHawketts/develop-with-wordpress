#!/bin/sh
# Wrapper script which allows wp-cli to run as www-data

sudo -u www-data /bin/wp-cli.phar "$@"