FROM nginx:latest

RUN apt-get update \
  && apt-get install -y \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libxslt1-dev \
    libldb-dev libldap2-dev \
    bzip2 \
    libbz2-dev pkg-config libssl-dev \
    cron \
    git \
    mysql-client \
    sendmail \
    sendmail-bin \
    vim \
    supervisor \
  && apt-get clean -y

#COPY etc/vhost.conf /etc/nginx/conf.d/default.conf

RUN usermod -u 1000 www-data \
    && groupmod -g 1000 www-data
