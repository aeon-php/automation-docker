ARG AEON_AUTOMATION_VERSION=1.x@dev

FROM aeonphp/automation:base
MAINTAINER Norbert Orzechowicz <contact@norbert.tech>

RUN composer clear-cache && composer global require aeon-php/automation:${AEON_AUTOMATION_VERSION} --prefer-dist && composer global show | grep automation

ENTRYPOINT ["/composer/vendor/bin/automation"]