FROM php:7.1-apache

ADD . /app

RUN apt-get update && \
    apt-get install \
    git zip unzip mysql-client \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    -y --no-install-recommends


RUN docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql



ENV COMPOSER_ALLOW_SUPERUSER 1
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

### INSTALL Drush
RUN cd /usr/local/bin \
  && mkdir drush-8 \
  && cd drush-8 \
  && composer require drush/drush:8.x \
  && ln -s /usr/local/bin/drush-8/vendor/bin/drush /usr/local/bin/drush

RUN a2enmod rewrite
RUN a2enmod headers

RUN cp /app/.docker/apache2/sites-available/000-default.conf /etc/apache2/sites-available/

WORKDIR /var/www/html



