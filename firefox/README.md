# Firefox

The `/firefox` folder contains all configuration files needed to setup the Firefox browser.

## Bookmarks

The `/firefox/bookmarks` folder contains all the bookmarks that should be imported to Firefox.

Firefox bookmarks can be exported by going to `Bookmarks menu → Manage Bookmarks → Import and Backup → Export`. They will be exported to an HTML file (`/firefox/bookmarks/bookmarks.html`).

They can be imported by going to the same menu, and choosing the `Import from HTML` option.

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
- `custom-css.json` - custom CSS that can be applied to the tabs panel. Can also be exported/imported in the Tree Style Tabs configuration page.