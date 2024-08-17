#!/bin/bash

echo "Backing up helix config..."
cp ~/.config/helix/config.toml ~/.config/helix/languages.toml .

echo "Committing and pushing changes..."
date_time=$(date +%Y-%m-%d %H:%M:%S)
git commit -am "Config update $date_time"
