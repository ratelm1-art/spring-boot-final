#!/bin/bash

set -e

echo "=== Starting Minikube (if not already running) ==="
minikube start

echo
echo "=== Applying Kubernetes manifests in k8s/ ==="
kubectl apply -f k8s/mysql-configmap.yaml
kubectl apply -f k8s/pv.yaml
kubectl apply -f k8s/pvc.yaml
kubectl apply -f k8s/mysql-deployment.yaml
kubectl apply -f k8s/mysql-service.yaml
kubectl apply -f k8s/jenkins-deployment.yaml
kubectl apply -f k8s/jenkins-service.yaml
kubectl apply -f k8s/nexus-deployment.yaml
kubectl apply -f k8s/nexus-service.yaml
kubectl apply -f k8s/webapp-deployment.yaml
kubectl apply -f k8s/webapp-service.yaml

echo
echo "=== Current ConfigMaps ==="
kubectl get configmap

echo
echo "=== Current Persistent Volumes / Claims ==="
kubectl get pv
kubectl get pvc

echo
echo "=== Current Deployments ==="
kubectl get deploy

echo
echo "=== Current Services ==="
kubectl get svc

echo
echo "Deployment script completed."

