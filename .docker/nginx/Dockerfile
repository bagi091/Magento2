FROM nginx:latest

#COPY etc/vhost.conf /etc/nginx/conf.d/default.conf

RUN usermod -u 1000 www-data \
    && groupmod -g 1000 www-data
