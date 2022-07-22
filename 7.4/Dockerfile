FROM ubuntu:20.04
MAINTAINER Balint Dozsa <balint.dozsa19@gmail.com>


# nginx
RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y \
	software-properties-common \
	supervisor \
	curl \
	nginx

# php
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y \
	php7.4 \
	php7.4-fpm \
	php7.4-curl \
	php7.4-json \
	php7.4-mbstring \
	php7.4-mysql \
	php7.4-opcache \
	php7.4-readline \
	php7.4-xml \
	php7.4-zip \
	php-xdebug \
	mysql-client

# composer
RUN curl -o /usr/local/bin/composer https://getcomposer.org/composer.phar && \
	chmod +x /usr/local/bin/composer

# backup
RUN mkdir /bckp
RUN cp /etc/nginx/nginx.conf /bckp/ && \
	cp /etc/nginx/sites-enabled/default /bckp/ && \
	cp /etc/php/7.4/cli/php.ini /bckp/cli_php.ini && \
	cp /etc/php/7.4/fpm/php-fpm.conf /bckp/ && \
	cp /etc/php/7.4/fpm/php.ini /bckp/fpm_php.ini

# copy conf files
COPY files/ /

# project dir
RUN mkdir /project
WORKDIR /project

# php fpm
RUN mkdir -p /run/php

# 80
EXPOSE 80

CMD ["/usr/bin/supervisord"]
