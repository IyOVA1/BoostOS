#!/bin/bash

# --- THE BOOSTOS TRANSFORMATION SCRIPT ---
# Force "No Questions Asked" Mode
export DEBIAN_FRONTEND=noninteractive

echo "------------------------------------------"
echo "Initializing BoostOS v1.0..."
echo "Preparing to break the 4th wall."
echo "------------------------------------------"

# 1. System Update
echo "[1/4] Overclocking system repositories..."
sudo apt-get update -y

# 2. Install the Look (Silent Mode Engaged)
echo "[2/4] Forging the UI (Installing Plasma Desktop)..."
# This long command ensures it ignores keyboard/config prompts
sudo apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" kde-plasma-desktop

# 3. Create 'The Vault' (The File Manager Rebrand)
echo "[3/4] Securing the Vault..."
# Ensure the Desktop directory exists before writing to it
mkdir -p ~/Desktop
echo "[Desktop Entry]
Name=The Vault
Exec=dolphin
Icon=system-file-manager
Type=Application" > ~/Desktop/TheVault.desktop
chmod +x ~/Desktop/TheVault.desktop

# 4. Finalizing the Boost Environment
echo "[4/4] Applying Electric Cyan accents..."
# (Ready for future wallpaper/theme commands)

echo "------------------------------------------"
echo "BOOSTOS INSTALLED."
echo "The 4th Wall has been breached."
echo "------------------------------------------"
