# Description
On this folder you will find examples on how to deploy a simple cluster with [ECK](https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-quickstart.html) locally on your machine.
#Pre-reqs
I have tested it with [k3s](https://k3s.io/), but it should work the same with other Kubernetes versions like [MiniKube](https://minikube.sigs.k8s.io) or [MikroK8s](https://microk8s.io/). Please, follow the setup steps of any Kubernetes of your choice.
I've decided to use nginx as ingress controller so I've taken this additional step:
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.7.1/deploy/static/provider/baremetal/deploy.yaml
```
I like to create a namespace for Elastic Stack environment:
```
kubectl create namespace elastic
```
#Installation
### Install the ECK operator
[Here](https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-deploy-eck.html) you can find the instructions to follow to install the operator.
### Installing our components
Please, fill the `<your_hostname>` placeholder with your own one.
On each folder component like `elasticsearch` or `kibana` we have to run:
```
kubectl apply -f . -n elastic
```
The desired order would be:
1. Elasticsearch
2. Kibana
3. APM
4. Ingress

For deleting:
```
kubectl delete -f . -n elastic
```

If you want to retrieve elastic user password run:
```
kubectl get secret elasticsearch-es-elastic-user -n elastic -o=jsonpath='{.data.elastic}' | base64 --decode; echo
```

### Adding your license
By default it has a Basic License (only Enterprise and Basic are allowed with ECK). You have to create a secret with the license and tag it, the operator will take it. 

```
kubectl create secret generic eck-license --from-file=eck-license.yaml -n elastic
kubectl label secret eck-license "license.k8s.elastic.co/scope"=operator -n elastic
```
The format of the secret file `eck-license.yaml` is:
```
apiVersion: v1
kind: Secret
metadata:
  labels:
    license.k8s.elastic.co/scope: operator 
  name: eck-license
  namespace: elastic-system
type: Opaque
data:
  license:
    <your_license_goes_here>
```
#### Note: you can go also with the [quickstart](https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-quickstart.html), the difference with this deployment is that I've increased the size of the Elasticsearch disk.
