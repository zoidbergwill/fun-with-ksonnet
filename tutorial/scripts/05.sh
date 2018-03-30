#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

kubectl proxy >/dev/null &
KC_PROXY_PID=$!
SERVICE_PREFIX=http://localhost:8001/api/v1/proxy
GUESTBOOK_URL=$SERVICE_PREFIX/namespaces/ks-dev/services/guestbook-ui

open $GUESTBOOK_URL