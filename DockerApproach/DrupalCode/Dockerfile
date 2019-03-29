FROM drupal:8.6.13-fpm
WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
	curl \
	git \
	mysql-client \
	vim \
	wget

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
	php composer-setup.php && \
	mv composer.phar /usr/local/bin/composer && \
	php -r "unlink('composer-setup.php');"

RUN wget -O drush.phar https://github.com/drush-ops/drush-launcher/releases/download/0.4.2/drush.phar && \
	chmod +x drush.phar && \
	mv drush.phar /usr/local/bin/drush

# stole idea from docker-drupal:/scripts/composer/install.sh
RUN mkdir -p config/sync
COPY config/drupal/ config/

RUN cp sites/default/default.settings.php sites/default/settings.php
RUN chown www-data:www-data sites/default/settings.php
RUN cat config/settings.php >> sites/default/settings.php
RUN chown -R www-data:www-data config
