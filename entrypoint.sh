#!/bin/sh

set -e

# Extract the base64 encoded config data and write this to the KUBECONFIG
mkdir -p ~/.kube
echo $INPUT_KUBECONFIG | base64 -d > ~/.kube/config

if [[ -z "${INPUT_WORKDIR}" ]]; then
  cd $INPUT_WORKDIR
fi


# Execute kubectl command
sh -c "kubectl $*"
