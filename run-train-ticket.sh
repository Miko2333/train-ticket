# Run in train-ticket root directory

minikube start -p v-xiruiliu --kubernetes-version=v1.33.0 --cpus=24 --memory=1048576MB --mount-string="/run/udev:/run/udev" --mount
minikube addons enable metrics-server -p v-xiruiliu
istioctl install --set profile=demo -y
kubectl apply -f https://openebs.github.io/charts/openebs-operator.yaml
kubectl patch storageclass openebs-hostpath -p '{"metadata":{"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
kubectl create namespace train-ticket
make deploy DeployArgs="--with-monitoring" Namespace=train-ticket
kubectl label namespace train-ticket istio-injection=enabled
kubectl rollout restart deployment -n train-ticket

# locust -f traffic_rasing/train-ticket/changing.py --host http://192.168.49.2:32677 --headless
