# Anwendungsintegration

## Setup Camel-K locally on Minikube

    minikube start
    minikube addon enable registry

    helm repo add camel-k https://apache.github.io/camel-k/charts
    export REGISTRY_ADDRESS=$(kubectl -n kube-system get service registry -o jsonpath='{.spec.clusterIP}')

    helm install --generate-name --set platform.build.registry.address=${REGISTRY_ADDRESS} --set platform.build.registry.insecure=true camel-k/camel-k

You can have a look at the running pods with

    kubectl get pod

and you can list all releases with

    helm list

You can install the camel-k CLI "kamel" by extracting it to `/usr/bin`.

- [Camel-K Helm Chart](https://artifacthub.io/packages/helm/camel-k/camel-k)
- [Camel-K CLI Release](https://github.com/apache/camel-k/releases)

### Troubleshooting

#### CrashLoopBackOff - dial tcp 10.96.0.1:443: connect: network is unreachable

Check the information about the client-server status of Kubernetes

    kubectl config view

Set the right context

    kubectl config use-context minikube

https://stackoverflow.com/questions/49260135/unable-to-connect-to-the-server-dial-tcp-i-o-time-out
