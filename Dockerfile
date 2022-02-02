FROM php:7.4-apache
RUN apt-get update && apt-get upgrade -y
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli && apt install -y mariadb-client && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY bookmedik /var/www/html/
ADD script.sh /var

RUN chmod +x /var/script.sh

ENV USER_BM_DATABASE admin
ENV PASSWD_BM_DATABASE admin
ENV HOST_BM_DATABASE servidor_mysql
ENV NAME_BM_DATABASE bookmedik

CMD ["/bin/bash", "/var/script.sh"]

