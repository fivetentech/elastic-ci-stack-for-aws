#!/usr/bin/env bash
set -euo pipefail
echo "Installing nix"
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate --no-confirm
echo ". /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh" | sudo tee -a /etc/buildkite-agent/hooks/pre-command
