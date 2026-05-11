#!/bin/bash

# --- THE BOOSTOS TRANSFORMATION SCRIPT ---
echo "------------------------------------------"
echo "Initializing BoostOS v1.0..."
echo "Preparing to break the 4th wall."
echo "------------------------------------------"

# 1. System Update
echo "[1/4] Overclocking system repositories..."
sudo apt update -y

# 2. Install the Look (KDE Plasma is the best for this)
echo "[2/4] Forging the UI (Installing Plasma Desktop)..."
sudo apt install kde-plasma-desktop -y

# 3. Create 'The Vault' (The File Manager Rebrand)
echo "[3/4] Securing the Vault..."
# This creates a desktop shortcut that renames the file manager
echo "[Desktop Entry]
Name=The Vault
Exec=dolphin
Icon=system-file-manager
Type=Application" > ~/Desktop/TheVault.desktop
chmod +x ~/Desktop/TheVault.desktop

# 4. Finalizing the Boost Environment
echo "[4/4] Applying Electric Cyan accents..."
# (In a real script, we'd add commands here to change wallpapers/themes)

echo "------------------------------------------"
echo "BOOSTOS INSTALLED."
echo "Please restart the session to see the changes."
echo "------------------------------------------"
