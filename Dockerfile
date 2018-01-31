FROM php:alpine
RUN wget -O /usr/bin/composer https://getcomposer.org/composer.phar && chmod +x /usr/bin/composer
RUN composer global require phpunit/phpunit
ENV PATH "/root/.composer/vendor/bin/:${PATH}"
ADD . /code
WORKDIR /code
RUN composer install
CMD phpunit
