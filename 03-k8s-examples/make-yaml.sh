#!/bin/bash


# Faz de conta que está buscando as informações de um cofre e gera o secret com o conteúdo
# Mas é mentira!! tá pegando do .env.example, Não faça isso! É feio! :-D

export ENV=`cat HelloLaravel/.env.example|base64 -w0`

envsubst '$ENV' < laravel-secret.template >laravel-secret.yaml

