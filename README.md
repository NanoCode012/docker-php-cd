# Docker-PHP-CD

A simple barebone setup for hosting PHP code on a docker containers with integration with nginx proxy and simple-git-deploy.


# Requirements

- docker (with external network created)
- docker-compose


# Setup

Follow the base steps then add other integrations by following their steps.


## Base

1. Clone repo.
    ```bash
    $ git clone --recurse-submodules https://github.com/NanoCode012/docker-php-cd.git
    ```
1. Rename `.env.sample` to `.env` and fill it in.

1. Create `app` directory and place PHP code within. You can either clone a repo in or directly copy code in.


## Continuous Deployment

1. Rename `deploy/deploy-config.example.php` to `deploy/deploy-config.php` and replace the information.

1. Set the following in `deploy/deploy-config.php`
    ```php
    define('USE_COMPOSER', true);
    define('COMPOSER_HOME', '/tmp/composer');
    ```


## Nginx-Proxy
1. Rename `env/.ssl.env.sample` to `env/.ssl.env` and fill it in.


# How to start

When ALL SETUP is complete, run the below.

```bash
$ bash run.sh
```


# License
MIT