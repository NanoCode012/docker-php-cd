# Docker-PHP-CI

A simple barebone setup for hosting PHP code on a docker containers with integration with nginx proxy.

# Requirements

- docker (with external network created)
- docker-compose

# Setup

1. Rename `.env.sample` to `.env` and fill it in.
1. Create `app` directory and place PHP code within.
1. Rename `deploy/deploy-config.example.php` to `deploy/deploy-config.php` and replace the information.
1. (OPTIONAL) If you want integration with nginx proxy, rename `env/.ssl.env.sample` to `env/.ssl.env` and fill it in. Then, in `run.sh`, under `Start Containers` section, change to the second option.