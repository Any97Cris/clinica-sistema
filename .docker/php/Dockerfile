FROM php:8.3-fpm

# Install PHP extensions and Composer
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod uga+x /usr/local/bin/install-php-extensions && sync \
    && install-php-extensions \
    gd \
    xdebug \
    mysqli \
    pdo \
    pdo_mysql \
    pdo_pgsql \
    pgsql \
    zip \
    @composer \
    && rm /usr/local/bin/install-php-extensions

COPY xdebug.ini /usr/local/etc/php/conf.d/

WORKDIR /var/www/html

COPY entrypoint.sh /var/www/scripts/
ENTRYPOINT [ "bash", "/var/www/scripts/entrypoint.sh" ]
