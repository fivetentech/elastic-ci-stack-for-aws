#!/usr/bin/env bash
set -euo pipefail
echo "Installing 1password-cli"
wget https://cache.agilebits.com/dist/1P/op2/pkg/v2.18.0-beta.01/op_linux_amd64_v2.18.0-beta.01.zip
unzip op_linux_amd64_v2.18.0-beta.01.zip
rm op.sig
rm op_linux_amd64_v2.18.0-beta.01.zip
chmod +x op
sudo mv op /usr/local/bin/op
op -v
