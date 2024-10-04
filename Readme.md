# Deploy debug-shell

## Deploy with kubectl

```sh
export APP_NS="default"
export APP_NAME="debug-shell"
export APP_IMAGE="ubuntu:latest"
export PORT_EXT=8080
export PORT_INT=80

# run and change the entrypoint to let it run indefinitely
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

## Deploy to ArgoCD

```sh
#
argocd app create debug-shell --repo  http://gitea-http.git.svc.cluster.local:3000/aruba-demo/debug-shell.git --path debug-shell --dest-server https://kubernetes.default.svc --dest-namespace default --sync-policy auto --upsert
```
