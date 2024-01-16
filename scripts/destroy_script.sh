#!/bin/bash

######################################################################################
## Destroy an OpenShift cluster
######################################################################################
function boostrap_cluster() {
    local clusterName=$1
    echo ":bomb: destroying cluster '$clusterName'..."
	if openshift-install --log-level debug destroy cluster --dir="$clusterName" ; then
        rm -rf "$clusterName"
        echo "OpenShift cluster destroyed"
        echo "🗑 OpenShift cluster destroyed"
    else
        say "Cluster destruction failed"
    fi
}

boostrap_cluster "$@"
