FROM php:7.1-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev \
    mysql-client libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install mcrypt pdo_mysql

RUN docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install opcache
ADD php-config/opcache.ini /usr/local/etc/php/conf.d/opcache.ini
ADD php-config/opcache-blacklist.txt /usr/local/etc/opcache-blacklist.txt
