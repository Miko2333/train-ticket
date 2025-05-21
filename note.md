具体使用可以参考原 repo 地址：https://github.com/FudanSELab/train-ticket
API 具体定义可以参考其 github wiki

run-train-ticket.sh 可以新建一个带 monitor 的 train-ticket 集群
deployment/kubernetes-manifests/quickstart-k8s/yamls/deploy.yaml.sample 为所有服务的配置文件，修改这个文件即可
为了正常运行，修改了配置文件，放大了若干个服务的 limit，并为一些服务镜像添加了 NET_ADMIN 权限，具体可以参考 ts-route-service
端口 32677