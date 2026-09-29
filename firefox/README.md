# Firefox

The `/firefox` folder contains all configuration files needed to setup the Firefox browser.

## Bookmarks

The `/firefox/bookmarks` folder contains all the bookmarks that should be imported to Firefox.

Firefox bookmarks can be exported by going to `Bookmarks menu → Manage Bookmarks → Import and Backup → Export`. They will be exported to an HTML file (`/firefox/bookmarks/bookmarks.html`).

They can be imported by going to the same menu, and choosing the `Import from HTML` option.

## Browser UI

- **Show the Bookmarks (favorites) Toolbar**: right-click on the tab bar (or any toolbar) → `Bookmarks Toolbar` → `Always Show`.
- **Move tabs to the sidebar and hide the native tab bar**, so only Tree Style Tab's sidebar is visible:
  1. Go to `about:config`, search for `toolkit.legacyUserProfileCustomizations.stylesheets`, and set it to `true`.
  2. Go to `about:support`, find "Profile Folder", and click "Open Folder".
  3. Create a `chrome` folder inside it (if it doesn't already exist) and copy `/firefox/chrome/userChrome.css` from this repo into it.
  4. Restart Firefox.

## Extensions 

The `/firefox/extensions` folder contains all configuration files related to Firefox add-ons.

The extensions list was generated using the `extract-extensions.js` script, by following these steps:

- Open Firefox and go to `about:debugging#/runtime/this-firefox`
- Open the dev tools window
- Copy and paste the function in `extract-extensions.js` in the dev tools console, and execute it
- Copy the output in the console and paste it in `extensions-list.json`

For importing the extensions into Firefox, we can manually download them one by one by accessing the `url` parameter that every extension object contains.

### Tree Style Tabs

One of the extensions that should be present in the `extensions-list.json` file is the [Tree Style Tabs](https://addons.mozilla.org/en-US/firefox/addon/tree-style-tab/) extension. This extension also has some configuration files of its own, that are present in the `/firefox/extensions/tree-style-tabs` folder:

- `tst-settings.json` - main settings/configuration file for Tree Style Tabs. Can also be exported/imported in the Tree Style Tabs configuration page.
- `custom-css.css` - custom CSS that can be applied to the tabs panel. Can be loaded/saved via the "Load from File" / "Save as File" buttons next to the custom style rules field in the Tree Style Tab configuration page.

### Shortkeys

The [Shortkeys](https://addons.mozilla.org/firefox/addon/shortkeys/) extension allows the configuration of custom key shortcuts on Firefox. The `shortkeys/config.json` file contains the configuration of all shortcuts. In other to import it, follow these steps:

- Install the Shortkeys Firefox extension
- Go to "Manage Extension" -> "Preferences"
- Select the "Import" tab
- Paste the configuration that is present in the `shortkeys/config.json` file
- Click "Import"