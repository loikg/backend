FROM debian:latest
RUN apt-get update && apt-get -y install apache2 php7.0 php7.0-mysql libapache2-mod-php7.0  php-mbstring phpunit curl composer zip
RUN a2enmod php7.0
RUN a2enmod rewrite
EXPOSE 80

RUN mkdir -p /application/backend
WORKDIR /application/backend
COPY ./composer.json /application/backend
RUN composer install

VOLUME "/application/backend/vendor"

CMD /usr/sbin/apache2ctl -D FOREGROUND