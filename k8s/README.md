## [Service Type](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types)

Type values and their behaviors are:

* ClusterIP: Exposes the Service on a cluster-internal IP. Choosing this value makes the Service only reachable from within the cluster. This is the **default** ServiceType.

* NodePort: Exposes the Service on each Node’s IP at a static port (the `NodePort`). A `ClusterIP` Service, to which the NodePort Service routes, is automatically created. You’ll be able to contact the `NodePort` Service, from outside the cluster, by requesting `<NodeIP>:<NodePort>`.

* LoadBalancer: Exposes the Service externally using a cloud provider’s load balancer. `NodePort` and `ClusterIP` Services, to which the external load balancer routes, are automatically created.

* ExternalName: Maps the Service to the contents of the externalName field (e.g. foo.bar.example.com), by returning a CNAME record with its value. No proxying of any kind is set up.

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