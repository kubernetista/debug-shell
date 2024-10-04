set -x

export AKS_CLUSTER="aks-prd-admin"
export DOMAIN_ZONE="pvt.prd.dimension.ws"
export CLUSTER_FRIENDLY_NAME="hlabs-prod"

kubectx ${AKS_CLUSTER}

set +x
