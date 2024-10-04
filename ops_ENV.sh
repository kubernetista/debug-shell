set -x

export AKS_CLUSTER="ops"
export DOMAIN_ZONE="ops.dimension.ws"
export CLUSTER_FRIENDLY_NAME=${AKS_CLUSTER}

kubectx ${AKS_CLUSTER}

set +x
