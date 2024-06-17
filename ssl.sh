#! /bin/bash
## minikube start --driver=docker
## minikube status
## minikube addons list
## minikube addons enable dashboard
## minikube addons enable ingress
## minikube dashboard
##docker login
kubectl run wisecow --image=outlookdock/wisecow:latest
kubectl expose pod wisecow --port 4499
kubectl apply -f ingress.yaml
kubectl delete ingress.networking.k8s.io nginx
kubectl apply -f ingress.yaml
echo "$(minikube ip) example.com" | sudo tee -a /etc/hosts
cat /etc/hosts | tail -n 1
curl example.com
curl -k https//:example.com
openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout tls.key -out tls.crt -subj "/CN=example.com" -days 365
kubectl create secret tls example-com-tls --cert=tls.crt --key=tls.key
kubectl get secret example-com-tls
kubectl get secret -o yaml
kubectl apply -f ingress.yaml
curl -k https://example.com
curl --cacert tls.crt https://example.com
