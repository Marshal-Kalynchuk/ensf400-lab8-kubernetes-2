# ENSF 400 - Assignment 3 - Kubernetes

## Setup
1. **Start Minikube**:
   ```
   minikube start
   ```

2. **Enable Ingress**:
   ```
   minikube addons enable ingress
   ```

## Deployment
**Apply all pods, svc, and ingress:** `sh deploy.sh`

1. **Deploy Nginx**:
   - Deployment: `kubectl apply -f nginx-dep.yaml`
   - ConfigMap: `kubectl apply -f nginx-configmap.yaml`
   - Service: `kubectl apply -f nginx-svc.yaml`

2. **Deploy Backend Applications**:
   - App-1 Deployment: `kubectl apply -f app-1-dep.yaml`
   - App-1 Service: `kubectl apply -f app-1-svc.yaml`
   - App-2 Deployment: `kubectl apply -f app-2-dep.yaml`
   - App-2 Service: `kubectl apply -f app-2-svc.yaml`

3. **Configure Ingress**:
   - Nginx Ingress: `kubectl apply -f nginx-ingress.yaml`
   - App-1 Ingress: `kubectl apply -f app-1-ingress.yaml`
   - App-2 Ingress: `kubectl apply -f app-2-ingress.yaml`

## Testing
1. **Test Nginx Service**:
   ```
   curl http://$(minikube ip)/
   ```

   Expected responses:
   - "Hello World from [app-1-dep-...]"
   - "Hello World from [app-2-dep-...]"

2. **Test Canary Routing**:
    ```
   curl http://$(minikube ip)/app
   ```

   Expected responses:
   - "Hello World from [app-1-dep-...]"
   - "Hello World from [app-2-dep-...]"


## Cleanup
1. **Delete Resources**:
   ```
   kubectl delete -f nginx-dep.yaml
   kubectl delete -f nginx-configmap.yaml
   kubectl delete -f nginx-svc.yaml
   kubectl delete -f app-1-dep.yaml
   kubectl delete -f app-1-svc.yaml
   kubectl delete -f app-2-dep.yaml
   kubectl delete -f app-2-svc.yaml
   kubectl delete -f nginx-ingress.yaml
   kubectl delete -f app-1-ingress.yaml
   kubectl delete -f app-2-ingress.yaml
   ```

2. **Stop Minikube**:
   ```
   minikube stop
   ```
