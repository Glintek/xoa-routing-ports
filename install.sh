#!/bin/bash

# Exit on error
set -e

# Define repository URL
REPO_URL="https://raw.githubusercontent.com/Glintek/xoa-routing-ports/main"

# Download xoa-routing-ports file
echo "Downloading content..."
curl -sSL "${REPO_URL}/xoa-routing-ports" -o xoa-routing-ports
curl -sSL "${REPO_URL}/.vendor.default.conf" -o .vendor.default.conf

chmod +x xoa-routing-ports

echo "Installation completed successfully!"
