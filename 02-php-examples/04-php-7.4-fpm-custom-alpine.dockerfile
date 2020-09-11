###############################################################################
# Imagem PHP-7.4 baseada na imagem base alpine instalando todo o PHP do zero
#
FROM alpine:3.12

RUN apk add --no-cache  --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    php7-fpm php7-ctype php7-curl php7-dom php7-fileinfo php7-ftp php7-iconv php7-json \
    php7-ldap php7-mbstring php7-mysqlnd php7-openssl php7-pdo php7-pdo_sqlite php7-pear \
    php7-phar php7-posix php7-session php7-sodium php7-simplexml php7-sqlite3 php7-tokenizer \
    php7-xml php7-xmlreader php7-xmlwriter php7-zlib php7-zip php7-bz2 php7-intl php7-gd \
    php7-imap php7-mysqli php7-bcmath php7-pdo_mysql ca-certificates && \    
    ln -s /usr/sbin/php-fpm7 /usr/sbin/php-fpm && \
    set -x && \
    addgroup -g 82 -S www-data && \
    adduser -u 82 -D -S -G www-data www-data &&\
    mkdir -p /var/www/html && chown www-data:www-data /var/www/html

COPY zz_custom.conf /etc/php7/php-fpm.d/
COPY entrypoint.sh /usr/local/bin/


ENTRYPOINT ["entrypoint.sh"]
WORKDIR /var/www/html


STOPSIGNAL SIGQUIT

EXPOSE 9000

CMD ["php-fpm"]