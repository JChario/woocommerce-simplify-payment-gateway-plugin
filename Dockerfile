FROM wordpress:latest
MAINTAINER Simplify Commerce

ENV WOOCOMMERCE_VERSION 2.6.14
ENV SIMPLIFY_PLUGIN_VERSION 1.0.0

COPY . /usr/src/wordpress/wp-content/plugins/simplifycommerce/

RUN apt-get update \
    && apt-get install -y --no-install-recommends unzip wget ntp\
    && wget https://downloads.wordpress.org/plugin/woocommerce.$WOOCOMMERCE_VERSION.zip -O /tmp/temp.zip \
    && cd /usr/src/wordpress/wp-content/plugins \
    && unzip /tmp/temp.zip \
    && cd /usr/src/wordpress/wp-content/plugins \
    && rm /tmp/temp.zip \
    && rm -rf /var/lib/apt/lists/* \
    && cd /usr/src/wordpress/wp-content/plugins/ \
    && chown -R www-data:www-data woocommerce/ \
    && chown -R www-data:www-data simplifycommerce/

VOLUME ["/var/www/html"]