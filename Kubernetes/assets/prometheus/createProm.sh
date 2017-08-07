#!/usr/bin/env bash
NAMESPACE=prom
YAMLS=(
prometheus-volume-claim.yaml
prometheus-rbac-setup.yaml
prometheus-configmap.yaml
prometheus-rules.yaml
prometheus-deployment.yaml
prometheus-service.yaml
)

DIR=$(dirname $0)
for ii in ${YAMLS[@]}
do
  CMD="kubectl -n=$NAMESPACE apply -f ${DIR}/$ii"
  echo $CMD
  eval $CMD
done

