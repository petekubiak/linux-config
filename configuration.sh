#!/bin/bash

echo "Installing i3..."
sudo apt update && sudo apt install xorg xinit i3

echo "Installing alacritty..."
sudo apt install alacritty

echo "Setting up autologin service..."
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
sudo echo `[Service]
Type=simple
ExecStart=
ExecStart=-/sbin.agetty --autologin $USER --noclear %I 384400 linux
` > /etc/systemd/system/getty@tty1.service.d/override.conf

echo "Setting up i3 autostart..."
echo `
# Startx automatically
  if [[ -x "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    . startx
    logout
  fi
` >> /home/$USER/.profile
