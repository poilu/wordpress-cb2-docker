FROM wordpress

SHELL ["/bin/bash", "-c"]

RUN apt-get update -y && apt-get install -y git nano wget curl gnupg zip unzip

#install php composer
COPY get_composer.sh /tmp/get_composer.sh
RUN cd /tmp && ./get_composer.sh

# install node with nmp
RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -
RUN apt-get -y install nodejs

#install commons-booking-2 from master
RUN cd /var/www && mkdir -p ./composer && cd ./composer && git clone https://github.com/wielebenwir/commons-booking-2.git
RUN chown -R www-data:www-data /var/www

# copy entrypoint
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

#switch to www-data user
USER www-data

# run php composer
RUN cd /var/www/composer/commons-booking-2 && composer install && npm install

#switch back to root user
USER root

# set entrypoint
ENTRYPOINT ["entrypoint.sh"]
CMD ["apache2-foreground"]



