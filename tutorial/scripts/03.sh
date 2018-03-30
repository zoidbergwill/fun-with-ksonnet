#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

cd guestbook

ks generate deployed-service guestbook-ui \
  --image gcr.io/heptio-images/ks-guestbook-demo:0.1 \
  --type ClusterIP