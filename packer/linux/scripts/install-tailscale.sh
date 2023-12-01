#!/usr/bin/env bash
set -euo pipefail
echo "Installing tailscale"
curl -fsSL https://tailscale.com/install.sh | sh
