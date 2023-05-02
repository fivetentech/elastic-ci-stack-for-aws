#!/bin/bash
# shellcheck disable=SC2094
set -euo pipefail

## Configures docker before system starts

# Write to system console and to our log file
# See https://alestic.com/2010/12/ec2-user-data-output/
exec > >(tee -a /var/log/elastic-stack.log|logger -t user-data -s 2>/dev/console) 2>&1

# Set user namespace remapping in config
if [[ "${DOCKER_USERNS_REMAP:-false}" == "true" ]] ; then
  cat <<< "$(jq '."userns-remap"="buildkite-agent"' /etc/docker/daemon.json)" > /etc/docker/daemon.json
fi

# Set experimental in config
if [[ "${DOCKER_EXPERIMENTAL:-false}" == "true" ]] ; then
  cat <<< "$(jq '.experimental=true' /etc/docker/daemon.json)" > /etc/docker/daemon.json
fi

# Move docker root to the ephemeral device
if [[ "${BUILDKITE_ENABLE_INSTANCE_STORAGE:-false}" == "true" ]] ; then
  cat <<< "$(jq '."data-root"="/mnt/ephemeral/docker"' /etc/docker/daemon.json)" > /etc/docker/daemon.json
fi

# Customise address pools
cat <<<"$(jq '."default-address-pools"=[{"base":"172.17.0.0/12","size":20},{"base":"192.168.0.0/16","size":24}]' /etc/docker/daemon.json)" >/etc/docker/daemon.json
