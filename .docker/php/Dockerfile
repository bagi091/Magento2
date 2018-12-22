FROM php:7-fpm

RUN apt-get update \
  && apt-get install -y \
    cron \
    git \
    vim \
  && apt-get clean -y

# Get composer installed to /usr/local/bin/composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer.phar

COPY bin/* /usr/local/bin/

RUN chmod +x /usr/local/bin/*

RUN chmod 777 -Rf /var/www /var/www/.* \
	&& chown -Rf www-data:www-data /var/www /var/www/.* \
	&& usermod -u 1000 www-data \
	&& groupmod -g 1000 www-data
