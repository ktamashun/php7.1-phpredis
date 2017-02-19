FROM php:7.1-cli

ENV PHPREDIS_VERSION 3.1.1

RUN cd /tmp \
    && curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && cd phpredis-$PHPREDIS_VERSION \
    && phpize \
    && ./configure \
    && make && make install \
    && docker-php-ext-enable redis

CMD ["php-cli"]
