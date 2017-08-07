#!/usr/bin/env bash
#
POD=$(kubectl get pods -l app=prometheus  -o=name | awk -F"/" '{print $2}')

echo "send SIGHUP to pod $POD ..."
kubectl exec -it $POD -- sh -c "kill -1 1 && sleep 5 && kill -1 1"
