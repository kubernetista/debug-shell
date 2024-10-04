set -x

export AKS_CLUSTER="hal-dev-aks"
export DOMAIN_ZONE="pvt.dev.dimension.ws"
export CLUSTER_FRIENDLY_NAME="hlabs-dev"

kubectx ${AKS_CLUSTER}

set +x
