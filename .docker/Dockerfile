FROM drupal:8.5.5-apache


RUN apt-get -qq -y update

## Install Mysql Client
RUN apt-get install -qq -y mysql-client

### INSTALL COMPOSER
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_DISABLE_XDEBUG_WARN 1
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer self-update

### INSTALL Drush
RUN cd /usr/local/bin \
  && mkdir drush-8 \
  && cd drush-8 \
  && composer require drush/drush:8.x \
  && ln -s /usr/local/bin/drush-8/vendor/bin/drush /usr/local/bin/drush
