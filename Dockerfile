FROM mattrayner/lamp:latest-1804

RUN cd app && \
    mkdir /var/www/.composer && \
    chown -R www-data:staff /var/www/.composer

COPY deploy /app/deploy
COPY app /app/

RUN apt update && apt install -y rsync sudo

CMD ["bash", "/run.sh"]