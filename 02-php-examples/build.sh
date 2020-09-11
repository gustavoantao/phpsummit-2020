#!/bin/bash

buildcmd="docker image build"

if [ "$1" == "" ];
then
    echo "Uso: $0 <dockerfile-number>"
    echo "Ex.: $0 01"
    exit 1
fi


case  $1 in
    1)
    $buildcmd -t php-7.4-fpm-custom-alpine -f 01-php-7.4-fpm-oficial-extensions.dockerfile .
    ;;
    2)
    $buildcmd -t php-7.4-fpm-alpine-extensions -f 02-php-7.4-fpm-alpine-extensions.dockerfile .
    ;;
    3)
    $buildcmd -t php-7.4-fpm-alpine-extensions-builder-pattern -f 03-php-7.4-fpm-alpine-extensions-builder-pattern.dockerfile .
    ;;
    4)
    $buildcmd -t php-7.4-fpm-custom-alpine -f 04-php-7.4-fpm-custom-alpine.dockerfile .
    ;;
    *)
    echo "Número inválido"
    ;;
esac