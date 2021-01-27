#!/bin/sh

minikube start --driver=virtualbox
minikube docker-env
eval $(minikube docker-env)

minikube addons enable metallb

sed -i '' s/CIP/$(minikube ip)/g "srcs/metallb/metallb-conf.yaml"
kubectl apply -f srcs/metallb/metallb-conf.yaml

sed -i '' s/CIP/$(minikube ip)/g "srcs/ftps/ftps.sh"
sed -i '' s/CIP/$(minikube ip)/g "srcs/nginx/nginx.conf"

declare -a names=("nginx" "wordpress" "mysql" "phpmyadmin" "ftps" "grafana" "influxdb")

#declare -a names=("nginx")

for name in "${names[@]}"; do
    docker build ./srcs/$name/ -t $name-server
done

kubectl apply -f srcs/metallb/metallb-conf.yaml
# docker build ./srcs/nginx-conf/ -t nginx-server
# docker build ./srcs/wp-conf/ -t wp-server
# docker build ./srcs/mysql-conf/ -t mysql-server
# docker build ./srcs/pma-conf/ -t pma-server
# docker build ./srcs/ftps/ -t ftps-server
# dockre build ./srcs/grafana/ -t grafana-server

sed -i '' s/$(minikube ip)/CIP/g "srcs/metallb/metallb-conf.yaml"
sed -i '' s/$(minikube ip)/CIP/g "srcs/nginx/nginx.conf"
sed -i '' s/$(minikube ip)/CIP/g "srcs/ftps/ftps.sh"


for name in "${names[@]}"; do
    kubectl create -f ./srcs/$name/$name-conf.yaml
done

# kubectl create -f ./srcs/nginx-conf/nginx-conf.yaml
# kubectl create -f ./srcs/wp-conf/wp-conf.yaml
# kubectl create -f ./srcs/mysql-conf/mysql-conf.yaml
# kubectl create -f ./srcs/pma-conf/pma-conf.yaml
# kubectl create -f ./srcs/ftps/ftps-conf.yaml
# kubectl create -f ./srcs/grafana/grafana-conf.yaml
