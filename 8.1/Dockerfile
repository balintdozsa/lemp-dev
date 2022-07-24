FROM ubuntu:22.04
MAINTAINER Balint Dozsa <balint.dozsa20@gmail.com>

# nginx
RUN apt-get update && \
	apt dist-upgrade -y && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y \
	software-properties-common \
	supervisor \
	curl \
	nginx

# php
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
	php8.1 \
	php8.1-bcmath \
	php8.1-bz2 \
	php8.1-cli \
	php8.1-curl \
	php8.1-fpm \
	php8.1-gd \
	php8.1-mbstring \
	php8.1-mysql \
	php8.1-opcache \
	php8.1-readline \
	php8.1-sqlite3 \
	php8.1-xdebug \
	php8.1-xml \
	php8.1-zip \
	php-xdebug \
	mysql-client
	
# composer
RUN curl -o /usr/local/bin/composer https://getcomposer.org/composer.phar && \
	chmod +x /usr/local/bin/composer
	
# backup
RUN mkdir /bckp
RUN cp /etc/nginx/nginx.conf /bckp/ && \
	cp /etc/nginx/sites-enabled/default /bckp/ && \
	cp /etc/php/8.1/cli/php.ini /bckp/cli_php.ini && \
	cp /etc/php/8.1/fpm/php-fpm.conf /bckp/ && \
	cp /etc/php/8.1/fpm/php.ini /bckp/fpm_php.ini
	
RUN echo '' >> /etc/php/8.1/fpm/php-fpm.conf && \
	echo 'include=/etc/php/8.1/fpm/user.conf' >> /etc/php/8.1/fpm/php-fpm.conf

# PHP config
RUN echo '' >> /etc/php/8.1/cli/php.ini && \
	echo '[Xdebug]' >> /etc/php/8.1/cli/php.ini && \
	echo 'xdebug.mode=coverage' >> /etc/php/8.1/cli/php.ini

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
