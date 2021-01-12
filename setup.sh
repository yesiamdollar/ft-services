#!/bin/sh

minikube start --driver=virtualbox
docker-machine create default
docker-machine env default
eval $(docker-machine env default)
minikube docker-env
eval $(minikube docker-env)


minikube addons enable metallb

sed -i '' s/CIP/$(minikube ip)/g "srcs/metallb/metallb-config.yaml"
sed -i '' s/CIP/$(minikube ip)/g "srcs/ftps/ftps.sh"
sed -i '' s/CIP/$(minikube ip)/g "srcs/metallb/metallb-config.yaml"
sed -i '' s/CIP/$(minikube ip)/g "srcs/nginx-conf/nginx.conf"

kubectl apply -f srcs/metallb/metallb-config.yaml
docker build ./srcs/nginx-conf/ -t nginx-server
docker build ./srcs/wp-conf/ -t wp-server
docker build ./srcs/mysql-conf/ -t mysql-server
docker build ./srcs/pma-conf/ -t pma-server
docker build ./srcs/ftps/ -t ftps-server

sed -i '' s/$(minikube ip)/CIP/g "srcs/metallb/metallb-config.yaml"
sed -i '' s/$(minikube ip)/CIP/g "srcs/nginx-conf/nginx.conf"
sed -i '' s/$(minikube ip)/CIP/g "srcs/metallb/metallb-config.yaml"
sed -i '' s/$(minikube ip)/CIP/g "srcs/ftps/ftps.sh"

kubectl create -f ./srcs/nginx-conf/nginx-conf.yaml
kubectl create -f ./srcs/wp-conf/wp-conf.yaml
kubectl create -f ./srcs/mysql-conf/mysql-conf.yaml
kubectl create -f ./srcs/pma-conf/pma-conf.yaml
kubectl create -f ./srcs/ftps/ftps-conf.yaml