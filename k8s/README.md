## Useful Command

### `kubectl`

* Get list of nodes/namespaces

```bash
kubectl get node | namespaces
```

* Get list of pods

```bash
kubectl get pods [-n <namespace>] | [--all-namespace]
```

* Describe node, namespace, pod details

```
kubectl describe node <node_name> | ns <namespace> | pods <pod_name>
```

* Port forwarding

```bash
kubectl port-forward <container_name> <host_port>:<container_port> [-n <namespace>]
```

### `helm`

## EKS

* [Create a kubeconfig for Amazon EKS](https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html)

## New Relic Integration

* [Kubernetes integration: install and configure](https://docs.newrelic.com/docs/integrations/kubernetes-integration/installation/kubernetes-installation-configuration#install)