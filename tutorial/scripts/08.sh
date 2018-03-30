#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

CURRENT_CONTEXT=$(kubectl config current-context)
CURRENT_CLUSTER=$(kubectl config get-contexts $CURRENT_CONTEXT | tail -1 | awk '{print $3}')
CURRENT_USER=$(kubectl config get-contexts $CURRENT_CONTEXT | tail -1 | awk '{print $4}')

kubectl create namespace ks-prod
kubectl config set-context ks-prod \
  --namespace ks-prod \
  --cluster $CURRENT_CLUSTER \
  --user $CURRENT_USER

ks env list
ks env add prod --context=ks-prod
ks env set default --name dev
ks env list

ks apply prod

kubectl proxy > /dev/null &
KC_PROXY_PID=$!
SERVICE_PREFIX=http://localhost:8001/api/v1/proxy
PROD_GUESTBOOK_URL=$SERVICE_PREFIX/namespaces/ks-prod/services/guestbook-ui

open $PROD_GUESTBOOK_URL