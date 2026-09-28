# Other things to install/configure

## Homebrew

Homebrew is a package manager for MacOS, that will allow the installation of other tools stated here. It can be installed using [this link](https://brew.sh/).

## Raycast

Raycast is a productivity app and "Spotlight" alternative for MacOS, installed via the `brew/Brewfile`. For configuration:

- set `cmd+ç` as the hotkey for the Raycast search bar
- map the Hyper Key to Caps Lock, without the Shift key (`Settings` → `Hyper Key`)
- set the navigation bindings to vim motions (`Settings` → `Advanced` → `Custom Navigation Bindings` → `Emacs/Vim style navigation`)

## Obsidian

Obsidian is a markdown-based note-taking app, installed via the `brew/Brewfile`. For configuration:

- turn on vim key bindings (`Settings` → `Editor` → `Vim key bindings`)

## fzf

fzf is a command-line fuzzy finder, that is used as the basis for some commands defined in the `.zshrc` file. It's installed via the `brew/Brewfile`.

## flux

flux is an app that changes the color and brightness of the computer display based on what time it is and the brightness of the room. It's installed via the `brew/Brewfile` (as the `flux-app` cask).

## Tailscale

Tailscale is a mesh VPN used to connect to this machine remotely, installed via the `brew/Brewfile` (as the `tailscale` formula, not the `tailscale-app` cask/GUI). The cask's sandboxed build can't run an SSH server, so this formula is used instead, which runs `tailscaled` as a background service via `brew services` (no menu bar app).

Start it now and have it launch at every boot/login:

```bash
sudo brew services start tailscale
```

Then connect to the tailnet and enable Tailscale SSH (allows other devices on the tailnet to SSH into this machine), also accepting subnet routes advertised by other nodes:

```bash
tailscale up --ssh --accept-routes
```

## Amphetamine

Amphetamine is a keep-awake utility, installed via the `brew/Brewfile` (as a Mac App Store app, through `mas`). To disable system sleep when the laptop lid is closed (Closed-Display Mode) without being prompted for a password every time, install its **Power Protect** feature:

- Open Amphetamine's settings and enable the Closed-Display Mode option that triggers the Power Protect prompt (or follow [this link](https://x74353.github.io/Amphetamine-Power-Protect/) for details).
- Approve the one-time Touch ID/administrator password prompt to install its script and sudoers config.

This isn't available via Homebrew (no formula/cask exists for it) — Amphetamine is sandboxed, so this signed installer package is the only supported way to set it up. Once installed, `pmset -a disablesleep 1` and `pmset -a disablesleep 0` no longer require a password.

## MacOS Settings

Some MacOS settings that should be changed:
- `Appearance`
  - change to dark mode
- `Desktop & Dock`
  - toggle "Automatically hide and show the Dock"
  - change default web browser to Firefox
- `Menu Bar`
  - toggle "Automatically hide and show the menu bar" (on desktop and/or on external displays), so SketchyBar is the only bar visible at the top of the screen
  - set the menu bar to have a background, instead of being transparent
- `Keyboard`
  - change "Key repeat rate" to Fast, and "Delay until repeat" to Short
  - change keyboard input source to Portuguese
- `Trackpad`
  - toggle "Tap to click"
