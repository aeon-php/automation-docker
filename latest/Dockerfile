FROM aeonphp/automation:base
MAINTAINER Norbert Orzechowicz <contact@norbert.tech>

ENV AEON_AUTOMATION_VERSION 1.0@dev

RUN composer clear-cache && composer global require aeon-php/automation:1.x@dev --prefer-dist && composer global show | grep automation