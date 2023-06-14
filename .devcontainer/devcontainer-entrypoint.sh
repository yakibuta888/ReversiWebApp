#!/bin/bash

set -eu

user="$(whoami)"
group="$(groups ${user} | awk '{print $3}')"
sudo chown -R "${user}:${group}" "/home/${user}"

exec "$@"
