#!/bin/bash

# Exit on error
set -e

# Define repository URL
REPO_URL="https://raw.githubusercontent.com/Glintek/xoa-routing-ports/main"

# Download xoa-routing-ports file
echo "Downloading xoa-routing-ports..."
curl -sSL "${REPO_URL}/xoa-routing-ports" -o xoa-routing-ports

# Download .vendor.default.conf file
echo "Downloading .vendor.default.conf..."
curl -sSL "${REPO_URL}/.vendor.default.conf" -o .vendor.default.conf

# Make xoa-routing-ports executable
chmod +x xoa-routing-ports

echo "Installation completed successfully!"
