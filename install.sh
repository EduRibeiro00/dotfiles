#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Robust symlink function
create_symlink() {
    local source="$1"
    local target="$2"
    
    # Check if source exists
    if [[ ! -e "$source" ]]; then
        echo -e "${RED}ERROR: Source '$source' does not exist!${NC}"
        return 1
    fi
    
    # Get absolute paths
    source=$(realpath "$source")
    
    # Create target directory if it doesn't exist
    target_dir=$(dirname "$target")
    if [[ ! -d "$target_dir" ]]; then
        echo -e "${YELLOW}Creating directory: $target_dir${NC}"
        mkdir -p "$target_dir"
    fi
    
    # Handle existing target
    if [[ -L "$target" ]]; then
        # It's already a symlink
        current_link=$(readlink "$target")
        if [[ "$current_link" == "$source" ]]; then
            echo -e "${GREEN}SKIP: '$target' already links to '$source'${NC}"
            return 0
        else
            echo -e "${YELLOW}REPLACE: Existing symlink '$target' -> '$current_link'${NC}"
            rm "$target"
        fi
    elif [[ -e "$target" ]]; then
        # It's a file or directory, backup first
        backup_name="${target}.backup.$(date +%Y%m%d_%H%M%S)"
        echo -e "${YELLOW}BACKUP: Moving existing '$target' to '$backup_name'${NC}"
        mv "$target" "$backup_name"
    fi
    
    # Create the symlink
    echo -e "${GREEN}LINK: '$source' -> '$target'${NC}"
    ln -s "$source" "$target"
    
    # Verify symlink was created
    if [[ -L "$target" ]]; then
        echo -e "${GREEN}SUCCESS: Symlink created successfully${NC}"
        return 0
    else
        echo -e "${RED}ERROR: Failed to create symlink${NC}"
        return 1
    fi
}

echo -e "${GREEN}Starting dotfiles installation...${NC}"

# Homebrew
echo -e "\n${YELLOW}=== Homebrew ===${NC}"
if ! command -v brew &> /dev/null; then
    echo -e "${YELLOW}Homebrew not found. Installing...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for the rest of this script
    if [[ -x /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -x /usr/local/bin/brew ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

if command -v brew &> /dev/null; then
    # Trust third-party taps used by the Brewfile (e.g. sketchybar, borders)
    brew trust --tap FelixKratz/formulae
    brew bundle --file="./brew/Brewfile"
else
    echo -e "${RED}ERROR: Homebrew installation failed. Install it manually from https://brew.sh/ and re-run this script.${NC}"
fi

# Neovim
echo -e "\n${YELLOW}=== Neovim Configuration ===${NC}"
create_symlink "./nvim" "$HOME/.config/nvim"

# Ghostty
echo -e "\n${YELLOW}=== Ghostty Configuration ===${NC}"
create_symlink "./ghostty/config.ghostty" "$HOME/.config/ghostty/config.ghostty"

# Starship
echo -e "\n${YELLOW}=== Starship Configuration ===${NC}"
create_symlink "./starship/starship.toml" "$HOME/.config/starship.toml"

# VS Code
VSCODE_USER="$HOME/Library/Application Support/Code/User"
echo -e "\n${YELLOW}=== VS Code Configuration ===${NC}"
create_symlink "./vscode/settings.json" "$VSCODE_USER/settings.json"
create_symlink "./vscode/keybindings.json" "$VSCODE_USER/keybindings.json"
create_symlink "./vscode/snippets" "$VSCODE_USER/snippets"
cat "./vscode/extensions.txt" | xargs -L 1 code --install-extension

# Enable key repeat (instead of the accent popup) for held keys, needed for Vim motions
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Zsh
echo -e "\n${YELLOW}=== Zsh Configuration ===${NC}"
create_symlink "./zsh/.zshrc" "$HOME/.zshrc"

# tmux
echo -e "\n${YELLOW}=== tmux Configuration ===${NC}"
create_symlink "./tmux/tmux.conf" "$HOME/.tmux.conf"

# Aerospace
echo -e "\n${YELLOW}=== Aerospace Configuration ===${NC}"
create_symlink "./aerospace/aerospace.toml" "$HOME/.aerospace.toml"

# SketchyBar
echo -e "\n${YELLOW}=== SketchyBar Configuration ===${NC}"
create_symlink "./sketchybar/plugins" "$HOME/.config/sketchybar/plugins"
create_symlink "./sketchybar/sketchybarrc" "$HOME/.config/sketchybar/sketchybarrc"
create_symlink "./sketchybar/colors.sh" "$HOME/.config/sketchybar/colors.sh"

# JankyBorders
echo -e "\n${YELLOW}=== JankyBorders Configuration ===${NC}"
create_symlink "./jankyborders/bordersrc" "$HOME/.config/borders/bordersrc"

# Wallpaper
echo -e "\n${YELLOW}=== Wallpaper ===${NC}"
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$(realpath ./wallpaper/wallpaper-boat.png)\""

echo -e "\n${GREEN}Dotfiles installation complete!${NC}"
echo -e "${YELLOW}Note: You may need to restart your terminal or source your shell configuration.${NC}"
