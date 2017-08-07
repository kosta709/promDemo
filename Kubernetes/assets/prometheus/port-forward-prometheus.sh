#!/usr/bin/env bash
#
# forwards pod to local port - $1 or pod_port
#
POD_LABEL="app=prometheus"
POD_PORT="9090"
PORT=${1:-$POD_PORT}

CURRENT_CLUSTER=$(kubectl config get-contexts | awk '/^\*/ {print $2} ')
POD=$(kubectl get pods -l $POD_LABEL  -o=name | awk -F"/" 'NR==1{print $2}')
echo "Current cluster is $CURRENT_CLUSTER"
echo "pod $POD_LABEL is $POD "

PORT_FORWARD_CMD="kubectl port-forward $POD ${PORT}:${POD_PORT} "

echo "launch $PORT_FORWARD_CMD ..."
eval $PORT_FORWARD_CMD 
