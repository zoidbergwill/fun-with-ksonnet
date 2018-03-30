#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

ks init guestbook --context ks-dev --api-spec=version:v1.8.0
