#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

function main {
    sudo nixos-rebuild --flake ".#$(hostname)" switch
}

main "${@}"

