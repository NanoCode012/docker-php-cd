FROM mattrayner/lamp:latest-1804

RUN apt update && apt install -y rsync sudo

COPY deploy /app/deploy
COPY app /app/

CMD ["bash", "/run.sh"]