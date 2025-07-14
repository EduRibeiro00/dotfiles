#!/bin/bash

# NeoVim
ln -s ./nvim ~/.config/nvim

# Oh My Zsh
ln -s ./oh-my-zsh-custom ~/.oh-my-zsh/custom

# VSCode
VSCODE_CONFIG="$HOME/Library/Application Support/Code/User"
ln -s "./vscode/settings.json" "$VSCODE_CONFIG/settings.json"
ln -s "./vscode/keybindings.json" "$VSCODE_CONFIG/keybindings.json"
ln -s "./vscode/snippets" "$VSCODE_CONFIG/snippets"

# zsh
ln -s ./zsh/.zshrc ~/.zshrc