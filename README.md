# Dotfiles (and other things)

This repo contains all the essential tools and respective configuration files needed for setting up the environment in a new machine. It contains the following folders:

- `/aerospace` - Contains all configurations for the tiling manager Aerospace.
- `/brew` - Contains all necessary Homebrew installations (TODO).
- `/firefox` - Contains all necessary Firefox add-ons and bookmarks that should be imported.
- `/ghostty` - Contains the configuration file that can be imported to immediately configure the Ghostty terminal.
- `/jankyborders` - Contains the configuration files for JankyBorders, the tool that allows to set the borders around the windows.
- `/nvim` - Contains my NeoVim configuration.
- `/old` - Folder containing old configurations or tools that I no longer use for my setup.
- `/others` - Contains info about how to install and configure other tools, such as Raycast, fzf, and others. Also contains some MacOS settings that should be changed.
- `/sketchybar` - Contains the configuration files for Sketchybar, that will be visible in the top of the screen.
- `/starship` - Contains the configuration file for Starship.
- `/tmux` -  Contains the `tmux.conf` file necessary to configure tmux.
- `/vscode` - Contains info about all necessary extensions that should be installed, as well as user settings, keybindings, and snippets.
- `/zsh` - Contains the `.zshrc` file that configures the zsh terminal.

We can automatically install and create symlinks for the configurations of `NeoVim`, `Aerospace`, `Ghostty`, `VSCode`, `zsh` and more, by doing:

```bash
cd /path/to/this/repo
sh ./install.sh
```
