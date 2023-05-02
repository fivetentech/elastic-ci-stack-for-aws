#!/bin/bash
set -eu -o pipefail
echo "Installing nix"
sh <(curl -L https://nixos.org/nix/install) --daemon
echo ". /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh" | sudo tee -a /etc/buildkite-agent/hooks/pre-command
