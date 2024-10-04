set -x

export AKS_CLUSTER="hal-acc-aks"
export DOMAIN_ZONE="pvt.acc.dimension.ws"
export CLUSTER_FRIENDLY_NAME="hlabs-acc"

kubectx ${AKS_CLUSTER}

set +x
