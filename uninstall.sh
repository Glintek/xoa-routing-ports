#!/bin/bash

# Exit on error
set -e

# Check if doas is available
if ! command -v doas >/dev/null 2>&1; then
    echo "Error: doas command not found. This system requires doas for privilege elevation."
    exit 1
fi

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Error: This script requires root privileges to modify system routing rules."
    echo "Please run with doas: doas $0"
    exit 1
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ROUTING_SCRIPT="${SCRIPT_DIR}/xoa-routing-ports"

# Check if the routing script exists
if [ ! -f "${ROUTING_SCRIPT}" ]; then
    echo "Error: Could not find xoa-routing-ports script at ${ROUTING_SCRIPT}"
    exit 1
fi

# Ensure the script is executable
if [ ! -x "${ROUTING_SCRIPT}" ]; then
    echo "Error: xoa-routing-ports script is not executable"
    exit 1
fi

echo "Removing routing rules..."
if ! "${ROUTING_SCRIPT}" uninstall; then
    echo "Error: Failed to remove routing rules"
    exit 1
fi

echo "Removing installed files..."
rm -f "${ROUTING_SCRIPT}"
rm -f "${SCRIPT_DIR}/.vendor.default.conf"

echo "Uninstallation completed successfully!"

# Self-remove the script
echo "Removing uninstall script..."
rm -f "${BASH_SOURCE[0]}" 