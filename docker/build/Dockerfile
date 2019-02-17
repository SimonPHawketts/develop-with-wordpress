FROM wordpress:5.0.3-php7.2-apache
# Update the base image and install some utility programs
RUN apt-get update && apt-get install -y sudo less mysql-client && rm -rf /var/lib/apt/lists/*

# Install xdebug to enable debugging
RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini

# Install the WP-cli program so we can automate the wordpress install
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Copy some programs into the container and set permissions
COPY ./files/wp-su.sh /bin/wp
RUN chmod +x /bin/wp
RUN chmod +x /bin/wp-cli.phar
# Create a cache directory for wp-cli
RUN mkdir /var/www/.wp-cli && chown www-data:www-data /var/www/.wp-cli
RUN chown www-data:www-data /var/www/html -R

RUN mkdir /var/www/plugins && chown www-data:www-data /var/www/plugins
# Copy some plugins which are in zip format
COPY ./files/*.zip /var/www/plugins/

# Copy files which have content.
RUN mkdir /var/www/import && chown www-data:www-data /var/www/import
COPY ./files/site-content.wordpress.xml /var/www/import
COPY ./files/site-menu.xml /var/www/import