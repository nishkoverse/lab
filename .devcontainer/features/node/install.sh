#!/usr/bin/env bash
set -eux

NODE_VERSION="${VERSION:-v22.20.0}"
TAR="node-${NODE_VERSION}-linux-x64.tar.gz"
TMP="/tmp/${TAR}"

# download, extract permanently, cleanup
curl -fsSL -o "${TMP}" "https://nodejs.org/dist/${NODE_VERSION}/${TAR}"
tar -C /usr/local --strip-components=1 -xzf "${TMP}"
rm -f "${TMP}"
hash -r

npm install -g npm@latest --unsafe-perm=true --no-audit --no-fund
hash -r

node -v
npm -v
