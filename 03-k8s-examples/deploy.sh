#!/bin/bash
### ATENÇÃO - Este script é apenas um exemplo para um Lab... para produção procure utilizar uma ferramenta de CI/CD

./make-yaml.sh # Faz de conta que está buscando as informações de um cofre :-P


kubectl delete configmap configmap-wwwconf
kubectl create configmap configmap-wwwconf --from-file=wwwconf=www.conf
kubectl delete configmap configmap-nginxconf
kubectl create configmap configmap-nginxconf --from-file=defaultconf=default.conf
kubectl delete -f laravel-secret.yaml
kubectl apply -f laravel-secret.yaml
kubectl delete -f laravel-service.yaml
kubectl apply -f laravel-service.yaml
kubectl delete -f laravel-deployment.yaml
kubectl apply -f laravel-deployment.yaml
time kubectl rollout status deployment hello-laravel
