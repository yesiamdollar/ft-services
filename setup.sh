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
kubectl create -f ./srcs/nginx-conf/nginx-conf.yaml

