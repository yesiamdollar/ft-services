minikube start --driver=virtualbox
docker-machine create default
docker-machine env default
eval $(docker-machine env default)
minikube docker-env
eval $(minikube docker-env)

# create image

# enable metallb on minikube addons

minikube addons enable metallb
kubectl apply -f srcs/metallb/metallb-config.yaml


docker build ./srcs/nginx-conf/ -t nginx-server
docker build ./srcs/wp-conf/ -t wp-server
docker build ./srcs/mysql-conf/ -t mysql-server
docker build ./srcs/pma-conf/ -t pma-server

kubectl create -f ./srcs/nginx-conf/nginx-conf.yaml
kubectl create -f ./srcs/wp-conf/wp-conf.yaml
kubectl create -f ./srcs/mysql-conf/mysql-conf.yaml
kubectl create -f ./srcs/pma-conf/pma-conf.yaml