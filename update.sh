#!/bin/bash

echo "Backing up helix config..."
mkdir -p helix
cp ~/.config/helix/config.toml ~/.config/helix/languages.toml helix/

echo "Backing up i3 config..."
mkdir -p i3
cp ~/.config/i3/config i3/
sudo cp /etc/i3status.conf i3/

echo "Committing and pushing changes..."
date_time=$(date +"%Y-%m-%d@%H:%M:%S")
git add --all
git commit -m "Config update $date_time"
git push
