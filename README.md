# Devspace 
Its an open-source developer tool for Kubernetes that lets you develop and deploy cloud-native software faster.   

![Devspace](https://d33wubrfki0l68.cloudfront.net/42cf299a91a44c619c03b1fb1077eefec5ee5cdb/61a97/img/processes/workflow-devspace.png?raw=true "Devspace")
https://devspace.sh/

## Requirements
- Docker Desktop https://docs.docker.com/desktop/
- Hub Docker account https://hub.docker.com/
- KIND local Kubernetes cluster using Docker container “nodes”. https://kind.sigs.k8s.io/

## Create KinD Cluster
```sh
kind create cluster --config cluster.yaml
```

## Nginx DNS
```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml
kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=90s
```

## What is DevSpace?
DevSpace is a client-only, open-source developer tool for Kubernetes:

- Build, test and debug applications directly inside Kubernetes
- Develop with hot reloading: updates your running containers without rebuilding images or restarting containers
- Unify deployment workflows within your team and across dev, staging and production
- Automate repetitive tasks for image building and deployment

## Init DevSpace in the current folder
```sh
devspace init
> Use the Dockerfile in ./Dockerfile
```

```sh
 Which registry do you want to use for storing your Docker images?
  [Use arrows to move, type to filter]
> Use hub.docker.com => you are logged in as <your-registry>
  Use GitHub image registry
  Use other registry
```

```sh
? Which build stage (target) within your Dockerfile do you want to use for development?
  Choose `build` for quickstart projects.
  [Use arrows to move, type to filter]
> build
  production
  [none] (build complete Dockerfile)
```

```sh
? How do you want to deploy this project?
  [Use arrows to move, type to filter]
> Deploy with the component-chart (https://devspace.sh/component-chart/docs)
  Deploy with existing Kubernetes manifests (e.g. ./kube/deployment.yaml)
  Deploy with a local Helm chart (e.g. ./chart/)
  Deploy with a remote Helm chart
```

## Start Development Mode
```sh
devspace dev
```

## Devspace WebUI
```sh
http://localhost:8090/logs/containers
```

## CleanUp you DevSpace & Cluster
```sh
devspace cleanup images && devspace purge
kind delete cluster --name devspace
``` 