minikube start --driver=virtualbox
docker-machine create space
docker-machine env space
eval $(docker-machine env space)
minikube docker-env
eval $(minikube docker-env)

# create image

# enable metallb on minikube addons

minikube addons enable metallb
kubectl apply -f srcs/metallb/metallb-config.yaml


docker build ./srcs/nginx-conf/ -t nginx-server

docker build ./srcs/wp-config/ -t wp-server

kubectl create -f ./srcs/nginx-conf/nginx-conf.yaml
kubectl create -f ./srcs/wp-config/wp-conf.yaml