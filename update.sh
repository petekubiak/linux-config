#!/bin/bash

echo "Backing up helix config..."
mkdir -p helix
cp ~/.config/helix/config.toml ~/.config/helix/languages.toml helix/

echo "Backing up i3 config..."
mkdir -p i3
cp ~/.config/i3/config i3/
sudo cp /etc/i3status.conf i3/

echo "Backing up alacritty config..."
mkdir -p alacritty
cp ~/.config/alacritty/alacritty.toml alacritty/

echo "Backing up starship config..."
mkdir -p starship
cp ~/.config/starship.toml starship/

echo "Committing and pushing changes..."
date_time=$(date +"%Y-%m-%d@%H:%M:%S")
git add --all
git diff --staged
read -p "Please enter a commit message: " commit_message
if [[ $commit_message ]]; then
  commit_message="Config update $date_time: $commit_message"
else
  commit_message="Config update $date_time"
fi
git commit -m "$commit_message"
git push
