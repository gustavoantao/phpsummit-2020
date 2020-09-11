#!/bin/bash

buildcmd="docker image build"

if [ "$1" == "" ];
then
    echo "Uso: $0 <dockerfile-number>"
    echo "Ex.: $0 01"
    exit 1
fi

cd HelloLaravel
case  $1 in
    1)
    $buildcmd -t hello-laravel:php-custom-alpine -f 01-hello-laravel-custom-alpine.dockerfile .
    ;;
    2)
    $buildcmd -t hello-laravel:php-oficial-extensions -f 02-hello-laravel-oficial-extensions.dockerfile .    
    ;;
    *)
    echo "Número inválido"
    ;;
esac