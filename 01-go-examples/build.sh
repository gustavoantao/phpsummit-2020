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
    $buildcmd -t hello-go-golang-official -f 01-hello-go-golang-official.dockerfile .
    ;;
    2)
    $buildcmd -t hello-go-golang-alpine -f 02-hello-go-golang-alpine.dockerfile .
    ;;
    3)
    $buildcmd -t hello-go-golang-builder-pattern-alpine -f 03-hello-go-golang-builder-pattern-alpine.dockerfile .
    ;;
    4)
    $buildcmd -t hello-go-golang-builder-pattern-scratch -f 04-hello-go-golang-builder-pattern-scratch.dockerfile .
    ;;
    *)
    echo "Número inválido"
    ;;
esac