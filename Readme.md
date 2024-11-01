# Deploy debug-shell

## TODO: much needed updates

1. add more CLI tools (see below)
2. create docker image
3. switch to kustomize (and eventually get rid of the Helm repo)

```sh
# add useful CLI tools
apt-get -y install iputils-ping dnsutils netcat-openbsd telnet
```

## Deploy an Ubuntu container with kubectl

```sh
export APP_NS="default"
export APP_NAME="debug-shell"
export APP_IMAGE="ubuntu:latest"
export PORT_EXT=8080
export PORT_INT=80

# Run an Ubuntu container and change the entrypoint to let it run indefinitely
kubectl -n ${APP_NS} create deployment --image=${APP_IMAGE} ${APP_NAME} --port=${PORT_INT} -o yaml --dry-run=client \
  -- /bin/sh -c "sleep infinity" \
  | kubectl neat
```

## Push this git repo to Gitea

```sh
# add Gitea remote (execute from the git repo base directory)
git remote add local http://git.localhost:8000/aruba-demo/$(basename "${PWD}").git

# Push and create a public repo
git push -o repo.private=false -u local main
```

## Deploy an Nginx container using the Helm chart with ArgoCD

```sh
# Create an ArgoCD app deployed via Helm the helm chart in this repo
argocd app create debug-shell --repo  http://gitea-http.git.svc.cluster.local:3000/aruba-demo/debug-shell.git --path debug-shell --dest-server https://kubernetes.default.svc --dest-namespace default --sync-policy auto --upsert --values ../values.yaml
```
