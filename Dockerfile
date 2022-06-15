FROM ubuntu

ENV timezone=America/Sao_Paulo

RUN apt-get update && \
ln -snf /usr/share/zoneinfo/${timezone} /etc/localtime && echo ${timezone} > /etc/timezone && \
apt-get install -y apache2 && \
apt-get install -y php8.1 && \
apt-get install -y php-xdebug && \
apt-get install -y php8.1-mysql && \
apt-get install -y git && \
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && rm composer-setup.php && mv composer.phar /usr/local/bin/composer && chmod a+x /usr/local/bin/composer 


EXPOSE 80

WORKDIR /var/www/html

ENTRYPOINT /etc/init.d/apache2 start && /bin/bash

CMD ["true"]
