FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends \
    apt-utils \
    curl \
    # Instalar git
    git \
    # Instalar apache
    apache2 \
    # Instalar php 7.4
    libapache2-mod-php7.4 \
    php7.4-cli \
    php7.4-json \
    php7.4-curl \
    php7.4-fpm \
    php7.4-gd \
    php7.4-ldap \
    php7.4-mbstring \
    php7.4-mysql \
    php7.4-soap \
    php7.4-sqlite3 \
    php7.4-xml \
    php7.4-zip \
    php7.4-intl \
    php-imagick \
    # Instalar tools
    openssl \
    nano \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN usermod --non-unique --uid 1000 www-data && groupmod --non-unique --gid 1000 www-data

# Instalar composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configurar PHP
COPY drupal.ini /etc/php/7.4/mods-available/
RUN phpenmod drupal
# Configurar apache
RUN a2enmod rewrite expires
RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/drupal.conf
RUN a2enconf drupal
# Configurar vhost
COPY drupal.conf /etc/apache2/sites-available/
RUN a2dissite 000-default
RUN a2ensite drupal.conf

EXPOSE 80 443

RUN composer global require drush/drush

ENV PATH="~/.composer/vendor/bin:${PATH}"

RUN chown www-data:www-data /var/www/html -R

USER www-data

WORKDIR /var/www/html

RUN rm index.html

HEALTHCHECK --interval=5s --timeout=3s --retries=3 CMD curl -f http://localhost || exit 1

USER root

CMD apachectl -D FOREGROUND
