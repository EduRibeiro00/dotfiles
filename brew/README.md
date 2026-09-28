# brew

Homebrew is the package manager used to install most of the tools and apps referenced in this repo.

The `Brewfile` in this folder lists all the taps, formulas, and casks needed. It includes the `FelixKratz/formulae` tap (for `sketchybar` and `borders`), which is a third-party tap that newer versions of Homebrew refuse to load until explicitly trusted:

```bash
brew trust --tap FelixKratz/formulae
```

To install everything in one go, run:

```bash
brew bundle --file=./brew/Brewfile
```

It also installs the `font-fira-code-nerd-font` cask, a [Nerd Font](https://www.nerdfonts.com/) required for the icons/glyphs used by Ghostty (`ghostty/config.ghostty` sets `font-family = FiraCode Nerd Font Mono`), Neovim (`have_nerd_font = true` in `nvim/init.lua`), and SketchyBar's icons.

Amphetamine is only distributed through the Mac App Store, so it's installed via `mas` instead of a cask. For that entry to work, make sure you're signed in to the App Store app *before* running `brew bundle` — otherwise that line will fail silently.
