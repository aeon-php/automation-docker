ARG PHP_VERSION=7.4.13
ARG BASE_IMAGE_TAG_SUFFIX=cli-alpine
ARG BASE_IMAGE_TAG=${PHP_VERSION}-${BASE_IMAGE_TAG_SUFFIX}
ARG COMPOSER_VERSION

FROM php:${BASE_IMAGE_TAG}
MAINTAINER Norbert Orzechowicz <contact@norbert.tech>

RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini

ENV COMPOSER_HOME /composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_VERSION ${COMPOSER_VERSION:-2.0.8}

ADD https://getcomposer.org/installer /tmp/composer-setup.php
ADD https://composer.github.io/installer.sig /tmp/composer-setup.sig

RUN apk add --no-cache perl-utils \
  && echo "$(cat /tmp/composer-setup.sig)  /tmp/composer-setup.php" | shasum -c -a 384 \
  && php /tmp/composer-setup.php --no-ansi --install-dir=/sbin --filename=composer --version=${COMPOSER_VERSION}

VOLUME ["/automation"]
WORKDIR /automation