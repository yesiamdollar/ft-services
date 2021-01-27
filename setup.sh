#!/bin/sh

minikube start --driver=virtualbox
minikube docker-env
eval $(minikube docker-env)

minikube dashboard &

minikube addons enable metallb

sed -i '' s/CIP/$(minikube ip)/g "srcs/metallb/metallb-conf.yaml"
kubectl apply -f srcs/metallb/metallb-conf.yaml

sed -i '' s/CIP/$(minikube ip)/g "srcs/ftps/ftps.sh"
sed -i '' s/CIP/$(minikube ip)/g "srcs/nginx/nginx.conf"

declare -a names=("nginx" "wordpress" "mysql" "phpmyadmin" "ftps" "grafana" "influxdb")

for name in "${names[@]}"; do
    docker build ./srcs/$name/ -t $name-server
done

kubectl apply -f srcs/metallb/metallb-conf.yaml

sed -i '' s/$(minikube ip)/CIP/g "srcs/metallb/metallb-conf.yaml"
sed -i '' s/$(minikube ip)/CIP/g "srcs/nginx/nginx.conf"
sed -i '' s/$(minikube ip)/CIP/g "srcs/ftps/ftps.sh"


for name in "${names[@]}"; do
    kubectl create -f ./srcs/$name/$name-conf.yaml
done
