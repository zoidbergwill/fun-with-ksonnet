#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

ks show default

ks apply default
