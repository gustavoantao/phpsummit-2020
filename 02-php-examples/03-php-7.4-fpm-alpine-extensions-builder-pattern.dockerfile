###############################################################################
# Imagem PHP-7.4 otimizada 
# Multi-stage build (builder pattern)
# Primeiro realiza o build das extensões necessárias
#
FROM php:7.4.9-fpm-alpine AS extensions_source

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

# Estágio 2
# Faz o build da imagem limpa, apenas copiando os arquivos necessários da imagem temporária
FROM php:7.4.9-fpm-alpine

ENV EXT_DIR=/usr/local/lib/php/extensions/no-debug-non-zts-20190902
ENV LIB_DIR=/usr/lib

COPY --from=extensions_source \
${EXT_DIR}/mbstring.so \
${EXT_DIR}/zip.so \
${EXT_DIR}/intl.so \
${EXT_DIR}/gd.so \
${EXT_DIR}/imap.so \
${EXT_DIR}/xml.so \
${EXT_DIR}/mysqli.so \
${EXT_DIR}/json.so \
${EXT_DIR}/bcmath.so \
${EXT_DIR}/bz2.so \
${EXT_DIR}/pdo.so \
${EXT_DIR}/pdo_mysql.so \
${EXT_DIR}/ldap.so ${EXT_DIR}/

COPY --from=extensions_source \
${LIB_DIR}/libzip.so \
${LIB_DIR}/../../lib/libcrypto.so.1.1 \
${LIB_DIR}/../../lib/libssl.so.1.1 \
${LIB_DIR}/libstdc* \
${LIB_DIR}/libicudata.so \
${LIB_DIR}/libicui18n.so \
${LIB_DIR}/libicuio.so \
${LIB_DIR}/libicutest.so \
${LIB_DIR}/libicutu.so \
${LIB_DIR}/libicuuc.so \
${LIB_DIR}/libgcc_s.so.1 \
${LIB_DIR}/libpng.so \
${LIB_DIR}/libc-client.so \
${LIB_DIR}/libbz2.so \
${LIB_DIR}/libldap.so \
${LIB_DIR}/libldap_r-2.4.so.2 \
${LIB_DIR}/libldap_r.so \
${LIB_DIR}/liblber.so \
${LIB_DIR}/libsasl2.so ${LIB_DIR}/

COPY --from=extensions_source ${LIB_DIR}/php7/modules/intl.so ${LIB_DIR}/php7/modules/intl.so
COPY --from=extensions_source ${LIB_DIR}/libstdc* ${LIB_DIR}/libgcc_s.so.1 ${LIB_DIR}/

RUN ln -s ${LIB_DIR}/libzip.so ${LIB_DIR}/libzip.so.5 && \
    ln -s ${LIB_DIR}/libcrypto.so.1.1 ${LIB_DIR}/libcrypto.so && \
    ln -s ${LIB_DIR}/libssl.so.1.1 ${LIB_DIR}/libssl.so && \
    ln -s ${LIB_DIR}/libbz2.so ${LIB_DIR}/libbz2.so.1 && \
    ln -s ${LIB_DIR}/libicuio.so ${LIB_DIR}/libicuio.so.67 && \
    ln -s ${LIB_DIR}/libicui18n.so ${LIB_DIR}/libicui18n.so.64 && \
    ln -s ${LIB_DIR}/libicuuc.so ${LIB_DIR}/libicuuc.so.64 && \
    ln -s ${LIB_DIR}/libicudata.so ${LIB_DIR}/libicudata.so.64 && \
    ln -s ${LIB_DIR}/libldap.so ${LIB_DIR}/libldap-2.4.so.2 && \
    ln -s ${LIB_DIR}/liblber.so ${LIB_DIR}/liblber-2.4.so.2 && \
    ln -s ${LIB_DIR}/libsasl2.so ${LIB_DIR}/libsasl2.so.3 && \
    ln -s ${LIB_DIR}/libpng.so ${LIB_DIR}/libpng16.so && \
    ln -s ${LIB_DIR}/libpng.so ${LIB_DIR}/libpng16.so.16 && \
    ln -s ${LIB_DIR}/libc-client.so ${LIB_DIR}/libc-client.so.1