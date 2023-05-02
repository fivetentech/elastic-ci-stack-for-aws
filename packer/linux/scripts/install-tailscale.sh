#!/bin/bash
set -eu -o pipefail
echo "Installing tailscale"
curl -fsSL https://tailscale.com/install.sh | sh