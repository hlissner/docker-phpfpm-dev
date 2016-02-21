FROM debian
MAINTAINER Henrik Lissner <henrik@lissner.net>

RUN apt-get update && \
    apt-get install -y php5-fpm php5-mysql php-apc php5-curl php5-gd php5-intl \
                       php5-mcrypt php5-memcache php5-sqlite php5-tidy php5-xmlrpc php5-pgsql \
                       php5-mongo php5-ldap php5-json php5-imagick php5-redis && \
    apt-get autoremove -y && apt-get clean && apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/man/?? && \
    rm -rf /usr/share/man/??_*

COPY conf/php-fpm.conf /etc/php5/fpm/php-fpm.conf
COPY conf/www.conf /etc/php5/fpm/pool.d/www.conf
COPY conf/php.ini /etc/php5/fpm/php.ini

RUN ln -sf /dev/stdout /var/log/php5-fpm.log
RUN ln -sf /dev/stderr /var/log/fpm-php.www.log

EXPOSE 9000

CMD /usr/sbin/php5-fpm -c /etc/php5/fpm
