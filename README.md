# Docker-PHP-CD

A simple barebone setup for hosting PHP code on a docker containers with integration with nginx proxy and simple-git-deploy.


# Requirements

- docker (with external network created)
- docker-compose


# Setup

Follow the base steps then add other integrations by following their steps.


## Base

1. Rename `.env.sample` to `.env` and fill it in.

1. Create `app` directory and place PHP code within.


## Continuous Deployment

1. Rename `deploy/deploy-config.example.php` to `deploy/deploy-config.php` and replace the information.

1. If you use Composer, uncomment `dockerfile` property in `docker-compose.yml`. Make sure to set the following in `deploy/deploy-config.php`
    ```php
    define('USE_COMPOSER', true);
    define('COMPOSER_HOME', '/tmp/composer');
    ```


## Nginx-Proxy
1. Rename `env/.ssl.env.sample` to `env/.ssl.env` and fill it in. Then, in `run.sh`, under `Start Containers` section, change to the second option.


# How to start

When ALL SETUP is complete, run the below.

```bash
$ bash run.sh
```


# License
MIT