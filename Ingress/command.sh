./certbot certonly --manual --preferred-challenges=dns --email bkrraj@gmail.com \
--server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d *.azuredevopscloud.xyz

aws eks update-kubeconfig --region us-east-1 --name eksdemo1

#Deployment
kubectl create deploy red --image=bkrrajmali/red-strawberry:v1 --replicas 3
kubectl create deploy blue --image=bkrrajmali/blue-blueberry:v1 --replicas 3
kubectl create deploy green --image=bkrrajmali/green-apple:v1 --replicas 3

#Services
kubectl expose deployment red --port=80 --target-port=80 
kubectl expose deployment green --port=80 --target-port=80 
kubectl expose deployment blue --port=80 --target-port=80 

#Ingress Controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.1/deploy/static/provider/aws/deploy.yaml


kubectl get deploy -n ingress-nginx

kubectl scale deployment -n ingress-nginx ingress-nginx-controller --replicas 3

kubectl create secret tls nginx-tls-default --key="tls.key" --cert="tls.crt"

kubectl apply -f \
https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.0.0/standard-install.yaml