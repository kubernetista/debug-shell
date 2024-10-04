set -x

export AKS_CLUSTER="mon"
export DOMAIN_ZONE="mon.dimension.ws"
export CLUSTER_FRIENDLY_NAME=${AKS_CLUSTER}

kubectx ${AKS_CLUSTER}

set +x
