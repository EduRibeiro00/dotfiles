# Dotfiles (and other things)

This repo contains all the essential tools and respective configuration files needed for setting up the environment in a new machine. It contains the following folders:

- `/aerospace` - Contains all configurations for the tiling manager Aerospace.
- `/brew` - Contains all necessary Homebrew installations (TODO).
- `/firefox` - Contains all necessary Firefox add-ons and bookmarks that should be imported.
- `/iterm` - Contains the `.itermexport` file that can be imported to immediately configure the iTerm2 terminal.
- `/nvim` - Contains my NeoVim configuration.
- `/oh-my-zsh-custom` - Contains the custom plugins and themes that should be imported into Oh My Zsh.
- `/others` - Contains info about how to install and configure other tools, such as Raycast, fzf, and others. Also contains some MacOS settings that should be changed.
- `/tmux` -  Contains the `tmux.conf` file necessary to configure tmux.
- `/vscode` - Contains info about all necessary extensions that should be installed, as well as user settings, keybindings, and snippets.
- `/zsh` - Contains the `.zshrc` file that configures the zsh terminal.

We can automatically install and create symlinks for the configurations of `NeoVim`, `Aerospace`, `Oh My Zsh`, `VSCode`, `zsh` and more, by doing:

```bash
cd /path/to/this/repo
sh ./install.sh
```
