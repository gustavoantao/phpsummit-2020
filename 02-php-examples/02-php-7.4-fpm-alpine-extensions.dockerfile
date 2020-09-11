###############################################################################
# Imagem PHP-7.4 oficial baseada na distro Alpine
#
FROM php:7.4.9-fpm-alpine

#Dependências
RUN apk add --update --no-cache \
    libstdc++ zlib-dev libzip-dev \
    icu-dev php7-intl libgd libpng-dev \
    imap-dev openldap-dev oniguruma-dev && \   
    apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing libxml++-dev && \
#Extensões    
    #Mbstring
    docker-php-ext-install mbstring  && \ 
    #Zip
    docker-php-ext-install zip  && \
    #Intl
    docker-php-ext-configure intl && docker-php-ext-install intl  && \
    #GD
    docker-php-ext-configure gd && docker-php-ext-install gd && \
    #Imap
    docker-php-ext-configure imap && docker-php-ext-install imap && \
    #XML
    docker-php-ext-configure xml && docker-php-ext-install xml && \
    #Mysqli
    docker-php-ext-configure mysqli && docker-php-ext-install mysqli && \
    #Json
    docker-php-ext-configure json && docker-php-ext-install json && \
    #Bcmath
    docker-php-ext-configure bcmath && docker-php-ext-install bcmath && \
    #Bzip2
    docker-php-ext-configure bz2 && docker-php-ext-install bz2 && \
    #PDO
    docker-php-ext-configure pdo && docker-php-ext-install pdo && \
    docker-php-ext-configure pdo_mysql && docker-php-ext-install pdo_mysql && \
    #Ldap
    docker-php-ext-configure ldap && docker-php-ext-install ldap