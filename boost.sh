#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

echo "--- BOOSTOS: THE ULTIMATE OVERHAUL ---"

# 1. INSTALL EVERYTHING (The Brain & The Vision)
sudo apt-get update -y
sudo apt-get install -y kde-plasma-desktop x11vnc xvfb novnc python3-websockify dbus-x11

# 2. CREATE THE VAULT (Your Signature)
mkdir -p ~/Desktop
echo "[Desktop Entry]
Name=The Vault
Exec=dolphin
Icon=system-file-manager
Type=Application" > ~/Desktop/TheVault.desktop
chmod +x ~/Desktop/TheVault.desktop

# 3. THE "AUTO-VISION" SEQUENCE
# This kills any old stuck versions first
sudo pkill Xvfb; sudo pkill x11vnc; sudo pkill websockify

# Start the Ghost Screen
Xvfb :1 -screen 0 1280x720x24 &
sleep 2

# Start the Projector
x11vnc -display :1 -nopw -listen localhost -forever &
sleep 2

# Start the Web Bridge
websockify --web /usr/share/novnc/ 6080 localhost:5900 &
sleep 2

# 4. LAUNCH THE BRAIN
DISPLAY=:1 dbus-launch startplasma-x11 &

echo "------------------------------------------"
echo "BOOSTOS IS LIVE."
echo "Go to the PORTS tab and open 6080."
echo "------------------------------------------"
