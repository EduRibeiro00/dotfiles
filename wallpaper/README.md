# Wallpaper

The `wallpaper-boat.png` file in this folder is the desktop wallpaper used on this machine. `install.sh` sets it automatically via:

```bash
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "<path-to-file>"'
```
