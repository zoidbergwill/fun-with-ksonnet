#!/usr/bin/env bash

# Set up an API proxy so that you can access the guestbook-ui service locally
kubectl proxy > /dev/null &
KC_PROXY_PID=$!
SERVICE_PREFIX=http://localhost:8001/api/v1/proxy
GUESTBOOK_URL=$SERVICE_PREFIX/namespaces/ks-dev/services/guestbook-ui

# Check out the guestbook app in your browser
open $GUESTBOOK_URL
