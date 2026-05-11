#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

echo "--- BUILDING BOOSTOS FROM THE GROUND UP ---"

# 1. PURGE THE OLD BLOAT (Clean Slate)
sudo apt-get purge -y kde-plasma-desktop
sudo apt-get autoremove -y

# 2. INSTALL ONLY THE BONES
# Openbox is a minimalist window manager (super fast)
# Feh handles the wallpaper, Picom handles the "feel"
sudo apt-get update
sudo apt-get install -y openbox x11vnc xvfb novnc python3-websockify feh picom lxterminal dolphin

# 3. CONFIGURE THE ENVIRONMENT
mkdir -p ~/.config/openbox
echo "lxterminal &
dolphin &" > ~/.config/openbox/autostart

# 4. BRANDING: THE VAULT & WALLPAPER
mkdir -p ~/Desktop
echo "[Desktop Entry]
Name=The Vault
Exec=dolphin
Icon=system-file-manager
Type=Application" > ~/Desktop/TheVault.desktop
chmod +x ~/Desktop/TheVault.desktop

# Set a dark background so it doesn't look like a cheap mountain photo
# (We can replace this URL with a NoteRaft logo later!)
feh --bg-fill https://images.unsplash.com/photo-1614850523296-d8c1af93d400?q=80&w=1280&h=720 &

# 5. THE AUTO-VISUAL BRIDGE
sudo pkill Xvfb; sudo pkill x11vnc; sudo pkill websockify
Xvfb :1 -screen 0 1280x720x24 &
sleep 2
x11vnc -display :1 -nopw -listen localhost -forever &
websockify --web /usr/share/novnc/ 6080 localhost:5900 &

# 6. LAUNCH THE CUSTOM CORE
DISPLAY=:1 openbox-session &

echo "------------------------------------------"
echo "BOOSTOS CORE IS LIVE."
echo "Clean. Fast. No Bloat."
echo "------------------------------------------"
