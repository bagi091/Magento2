FROM php:7-fpm

RUN apt-get update \
  && apt-get install -y \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxslt1-dev \
    bzip2 \
    libbz2-dev pkg-config libssl-dev \
    cron \
    git \
    vim \
  && apt-get clean -y

# Configure the gd library
RUN docker-php-ext-configure \
  gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

# Install required PHP extensions
RUN docker-php-ext-install \
  gd \
  bcmath \
  intl \
  mbstring \
  pdo_mysql \
  xsl \
  zip \
  json \
  opcache \
  iconv \
  exif \
  soap \
  bz2 \
  dom \
  simplexml \
  fileinfo \
  mysqli

# Get composer installed to /usr/local/bin/composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer.phar

COPY bin/* /usr/local/bin/

RUN chmod +x /usr/local/bin/*

RUN chmod 777 -Rf /var/www /var/www/.* \
	&& chown -Rf www-data:www-data /var/www /var/www/.* \
	&& usermod -u 1000 www-data \
	&& groupmod -g 1000 www-data
