FROM php:7.1-fpm

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libicu-dev \
    libmcrypt-dev \
    libpng-dev \

    libxml2-dev \
    libxslt1-dev \
    libldb-dev libldap2-dev \
    bzip2 \
    libbz2-dev pkg-config libssl-dev \
    mysql-client \
    sendmail \
    sendmail-bin \
    supervisor \
# Install nginx
    && curl http://nginx.org/keys/nginx_signing.key | apt-key add - \
    && echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y ca-certificates nginx gettext-base \
    && rm -rf /var/lib/apt/lists/* \
# Clean Up
	&& apt-get clean -y

RUN docker-php-ext-install -j$(nproc) iconv mcrypt mbstring mysqli pdo_mysql zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-install xsl
RUN docker-php-ext-install soap

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ADD etc/php.ini /usr/local/etc/php/conf.d/40-custom.ini

RUN chmod 777 -Rf /var/www /var/www/.* \
	&& chown -Rf www-data:www-data /var/www /var/www/.* \
	&& usermod -u 1000 www-data \
	&& groupmod -g 1000 www-data \
	&& chsh -s /bin/bash www-data

VOLUME /var/www/html
WORKDIR /var/www/html

CMD ["php-fpm"]
