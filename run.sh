#!/bin/bash

# Download dotfiles from GitHub repository
BASE_URL="https://raw.githubusercontent.com/tungmv/dotfiles/refs/heads/main"

# List of dotfiles to download
dotfiles=(
    ".bashrc"
    ".vimrc"
    ".gitconfig"
    ".tmux.conf"
    ".zshrc"
    ".profile"
    ".aliases"
    ".functions"
)

# Create backup directory if it doesn't exist
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Download each dotfile
for file in "${dotfiles[@]}"; do
    echo "Downloading $file..."

    # Backup existing file if it exists
    if [ -f "$HOME/$file" ]; then
        echo "Backing up existing $file to $BACKUP_DIR"
        cp "$HOME/$file" "$BACKUP_DIR/"
    fi

    # Download the file
    curl -fsSL "$BASE_URL/$file" -o "$HOME/$file"

    if [ $? -eq 0 ]; then
        echo "Successfully downloaded $file"
    else
        echo "Failed to download $file"
    fi
done

echo "Dotfiles download complete!"
echo "Backups stored in: $BACKUP_DIR"