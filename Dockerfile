FROM php:7-alpine AS builder

# Copy composer files
COPY app/composer.json /app/composer.json
COPY app/composer.lock /app/composer.lock

RUN cd app && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    php composer.phar install && \
    rm composer.phar

FROM mattrayner/lamp:latest-1804

RUN cd app && \
    mkdir /var/www/.composer && \
    chown -R www-data:staff /var/www/.composer

COPY deploy /app/deploy
COPY --from=builder /app/node_modules /app/node_modules
COPY app /app/

RUN apt update && apt install -y rsync sudo

CMD ["bash", "/run.sh"]