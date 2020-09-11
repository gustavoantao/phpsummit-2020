kubectl delete configmap configmap-wwwconf
kubectl delete configmap configmap-nginxconf
kubectl delete -f laravel-secret.yaml
kubectl delete -f laravel-service.yaml
kubectl delete -f laravel-deployment.yaml
