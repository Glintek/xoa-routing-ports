#!/bin/bash

# Exit on error
set -e

# Define repository URL
REPO_URL="https://raw.githubusercontent.com/Glintek/xoa-routing-ports/main"

# Download xoa-routing-ports file
echo "Downloading content..."
curl -sSL "${REPO_URL}/xoa-routing-ports" -o xoa-routing-ports
curl -sSL "${REPO_URL}/.vendor.default.conf" -o .vendor.default.conf
curl -sSL "${REPO_URL}/uninstall.sh" -o uninstall.sh

chmod +x xoa-routing-ports
chmod +x uninstall.sh

echo "Installation completed successfully!"
