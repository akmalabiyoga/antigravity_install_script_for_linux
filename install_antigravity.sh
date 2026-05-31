#!/bin/bash

# Define paths
INSTALL_DIR="$HOME/Antigravity IDE"
EXECUTABLE="$INSTALL_DIR/antigravity-ide"
ICON_PATH="$INSTALL_DIR/resources/app/resources/linux/code.png"
DESKTOP_FILE="$HOME/.local/share/applications/antigravity.desktop"

echo "Setting permissions for Antigravity IDE..."

# List of files that need executable permissions
FILES_TO_CHMOD=(
    "$EXECUTABLE"
    "$INSTALL_DIR/bin/antigravity-ide"
    "$INSTALL_DIR/chrome-sandbox"
    "$INSTALL_DIR/chrome_crashpad_handler"
    "$INSTALL_DIR/libffmpeg.so"
    "$INSTALL_DIR/libEGL.so"
    "$INSTALL_DIR/libGLESv2.so"
    "$INSTALL_DIR/libvk_swiftshader.so"
    "$INSTALL_DIR/libvulkan.so.1"
)

for file in "${FILES_TO_CHMOD[@]}"; do
    if [ -f "$file" ]; then
        chmod +x "$file"
        echo "chmod +x $file"
    fi
done

echo "Creating application launcher..."

# Create the .desktop file
cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Name=Antigravity IDE
Comment=The Antigravity Integrated Development Environment
Exec="$EXECUTABLE" %F
Icon=$ICON_PATH
Type=Application
Terminal=false
Categories=Development;IDE;
MimeType=text/plain;inode/directory;
StartupNotify=true
StartupWMClass=antigravity-ide
EOF

chmod +x "$DESKTOP_FILE"

echo "Installation complete! You should now see Antigravity IDE in your application launcher."
