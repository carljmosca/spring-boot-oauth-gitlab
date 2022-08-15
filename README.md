


```
s2i build https://github.com/carljmosca/spring-boot-oauth-gitlab.git registry.access.redhat.com/ubi8/openjdk-17:1.14-3
```

```
kubectl create secret docker-registry githubregistry --docker-server=ghcr.io --docker-username=me --docker-password=9ac --docker-email=someemail@mail.com
```

```
helm upgrade --install hello-gitlab hello-gitlab --namespace=demo --create-namespace
```