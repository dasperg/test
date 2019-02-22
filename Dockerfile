##
#
#   GitLab Dockerfile
#   Follow instructions on GitLab
#   https://gitlab.com/help/user/project/container_registry
#
##

FROM php:7.2

RUN docker-php-ext-install bcmath pdo_mysql \
  && apt-get update && apt-get install -y unzip \
  && apt-get -qq install git-ftp \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer