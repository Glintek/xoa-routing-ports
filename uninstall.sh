#!/bin/bash

# Exit on error
set -e

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root (use sudo)"
    exit 1
fi

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Execute uninstall command
echo "Removing routing rules..."
"${SCRIPT_DIR}/xoa-routing-ports" uninstall

# Remove installed files
echo "Removing installed files..."
rm -f "${SCRIPT_DIR}/xoa-routing-ports"
rm -f "${SCRIPT_DIR}/.vendor.default.conf"

echo "Uninstallation completed successfully!"

# Self-remove the script
echo "Removing uninstall script..."
rm -f "${BASH_SOURCE[0]}" 