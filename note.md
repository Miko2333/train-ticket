具体使用可以参考原 repo 地址：https://github.com/FudanSELab/train-ticket，API 具体定义可以参考其 github wiki。

run-train-ticket.sh 可以新建一个带 monitor 的 train-ticket 集群。所有服务能正常运行的时间可能会在一个小时以上。
如果 train-ticket namespace 下有一两个服务挂了，是正常现象，应该不影响其他服务。但是需要确保 ts-gateway-service 正常运行。
deployment/kubernetes-manifests/quickstart-k8s/yamls/deploy.yaml.sample 为所有服务的配置文件，修改这个文件即可。
为了正常运行，修改了配置文件，放大了若干个服务的 limit，并为一些服务镜像添加了 NET_ADMIN 权限，具体可以参 ts-route-service 的配置部分。
端口 32677