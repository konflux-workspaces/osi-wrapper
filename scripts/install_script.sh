#!/bin/bash

######################################################################################
## Install an OpenShift Cluster
######################################################################################
function boostrap_cluster() {
    local clusterName=$1
    local baseDomain=$2
    echo ":package: boostrapping cluster '$clusterName'..."
    mkdir "$clusterName"
        sed -e "s|CLUSTER_NAME|$clusterName|g" install-config.tmpl.yaml > "$clusterName"/install-config.yaml
        sed -e "s|BASE_DOMAIN|$baseDomain|g" install-config.tmpl.yaml > "$clusterName"/install-config.yaml
        if openshift-install --log-level debug create cluster --dir="$clusterName" ; then
        echo "OpenShift cluster ready"
        echo "🕹 OpenShift cluster ready!"
        echo "export QUAY_NAMESPACE=$(whoami);"
        echo "export CLUSTER_CONFIG=$(pwd)/$clusterName;"
        echo "export KUBECONFIG=$(pwd)/$clusterName/auth/kubeconfig;"
        echo "export CONSOLE=https://console-openshift-console.apps.$clusterName.$baseDomain/"
        echo "oc login -u kubeadmin -p $(cat "$(pwd)"/"$clusterName"/auth/kubeadmin-password)"
    else
        echo "Cluster setup failed"
    fi
}

boostrap_cluster "$@"  
