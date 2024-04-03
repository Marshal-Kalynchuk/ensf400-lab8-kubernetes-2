#!/bin/bash

# Set the Minikube environment for Docker
eval $(minikube docker-env)

# Pull the images
docker pull ghcr.io/denoslab/ensf400-sample-app:v1
docker pull ghcr.io/denoslab/ensf400-sample-app:v2

# Apply the Kubernetes configurations
kubectl apply -f app-1-dep.yaml
kubectl apply -f app-1-svc.yaml
kubectl apply -f app-1-ingress.yaml
kubectl apply -f app-2-dep.yaml
kubectl apply -f app-2-svc.yaml
kubectl apply -f app-2-ingress.yaml
kubectl apply -f nginx-configmap.yaml
kubectl apply -f nginx-dep.yaml
kubectl apply -f nginx-svc.yaml
kubectl apply -f nginx-ingress.yaml

