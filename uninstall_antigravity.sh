#!/bin/bash

# Define paths
DESKTOP_FILE="$HOME/.local/share/applications/antigravity.desktop"

echo "Uninstalling Antigravity IDE launcher..."

# Remove the .desktop file
if [ -f "$DESKTOP_FILE" ]; then
    rm "$DESKTOP_FILE"
    echo "Removed $DESKTOP_FILE"
else
    echo "Application launcher not found."
fi

echo "Uninstallation complete. (Installation directory was kept)"
