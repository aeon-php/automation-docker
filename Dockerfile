ARG PHP_VERSION=8.1.24
ARG BASE_IMAGE_TAG_SUFFIX=cli-alpine3.18
ARG BASE_IMAGE_TAG=${PHP_VERSION}-${BASE_IMAGE_TAG_SUFFIX}
ARG BASE_IMAGE=php:${BASE_IMAGE_TAG}

FROM ${BASE_IMAGE}

MAINTAINER Norbert Orzechowicz <contact@norbert.tech>

ARG AEON_AUTOMATION_VERSION=^1.0

RUN echo "Building image for Automation: $AEON_AUTOMATION_VERSION"

ENV COMPOSER_HOME /composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV PATH /composer/vendor/bin:$PATH
ENV PHP_CONF_DIR=/usr/local/etc/php/conf.d

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apk add --no-cache tini \
  && echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini \
  && composer clear-cache \
  && composer global require aeon-php/automation:${AEON_AUTOMATION_VERSION} --prefer-dist

RUN composer global info aeon-php/automation

ENTRYPOINT ["/sbin/tini", "--", "/composer/vendor/bin/automation"]

VOLUME ["/automation"]
WORKDIR /automation
