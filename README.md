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
1. Copy `.env.sample` to `.env` and fill it in.

1. Create `app` directory and place PHP code within. You can either clone a repo in or directly copy code in.

## Continuous Deployment

1. Copy `deploy/deploy-config.example.php` to `deploy/deploy-config.php` and set the below,

    ```php
    define('SECRET_ACCESS_TOKEN', 'BetterChangeMeNowOrSufferTheConsequences');
    define('REMOTE_REPOSITORY', 'https://github.com/NanoCode012/simple-php-git-deploy.git');
    define('BRANCH', 'main');
    ```

## Composer

1. Follow the Continuous Deployment steps above.

1. Set the following,

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


# Additional Customizations

Extra configurations can be added to a file called `post_run.sh`. Some examples are provided in the sample file `post_run.sh.sample`. 
One example use case is to "auto-reset" the sql database. This can be good when we update the database structure and would like a clean reset.

1. Copy `post_run.sh.sample` to `post_run.sh`.

1. Add custom bash code to `post_run.sh`.


# License
MIT
