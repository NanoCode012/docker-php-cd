FROM mattrayner/lamp:latest-1804

COPY deploy /app/deploy
COPY app /app/

RUN apt update && apt install -y rsync sudo

CMD ["bash", "/run.sh"]