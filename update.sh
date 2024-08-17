#!/bin/bash

echo "Backing up helix config..."
mkdir -p helix
cp ~/.config/helix/config.toml ~/.config/helix/languages.toml helix/

echo "Committing and pushing changes..."
date_time=$(date +"%Y-%m-%d %H:%M:%S")
commit_message="Config update $date_time"
echo "Commit message: '$commit_message'"
git add --all
git commit -m "$commit_message"
