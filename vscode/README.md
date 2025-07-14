# VSCode

The `/vscode` folder contains all the configuration files needed to setup VSCode in a new computer. It contains the following files and folders:

- `extensions.txt` - contains all the VSCode extensions that should be installed. This file was generated using the command `code --list-extensions > extensions.txt`. To install all extensions listed in the file, we can run the command `cat extensions.txt | xargs -L 1 code --install-extension`.
- `settings.json` - user settings JSON file. Should be copy and pasted into the VSCode User Settings JSON file.
- `keybindings.json` - user keybindings JSON file. Should be copy and pasted into the VSCode User Keybindings JSON file.
- `/snippets` - contains all the user-created VSCode snippets. The folder contents should be copied into `~/Library/Application Support/Code/User/snippets/`.