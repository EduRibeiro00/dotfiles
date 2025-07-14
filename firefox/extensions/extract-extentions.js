(function() {
  // Function to extract text content from an element if it exists
  const getTextContent = (element, selector) => {
    const el = element.querySelector(selector);
    return el ? el.textContent.trim() : null;
  };
  
  // Find all extension items
  const extensionItems = document.querySelectorAll('.qa-debug-target-item[data-qa-target-type="extension"]');
  
  if (!extensionItems || extensionItems.length === 0) {
    console.error("No extensions found. Make sure you're on the about:debugging#/runtime/this-firefox page.");
    return;
  }
  
  // Array to store extension data
  const extensions = [];
  
  // Process each extension item
  extensionItems.forEach(item => {
    // Extract basic information
    const name = getTextContent(item, '.debug-target-item__name');
    
    // Extract details from fieldpairs
    const fieldpairs = item.querySelectorAll('.fieldpair');
    let extensionId = null;
    let internalUuid = null;
    
    fieldpairs.forEach(pair => {
      const title = getTextContent(pair, '.fieldpair__title');
      if (!title || !pair.querySelector('.fieldpair__description')) return;
      
      const description = pair.querySelector('.fieldpair__description');
      
      if (title === 'Extension ID') {
        extensionId = description.textContent.trim();
      } else if (title === 'Internal UUID') {
        internalUuid = description.textContent.trim();
      }
    });
    
    // Create extension object with essential information
    const extension = {
      name,
      extensionId,
      internalUuid,
      // Map known extension IDs to their URLs
      url: getExtensionUrl(extensionId)
    };
    
    extensions.push(extension);
  });
  
  // Get browser version
  const browserVersionEl = document.querySelector('.qa-runtime-name');
  const browserVersion = browserVersionEl ? browserVersionEl.textContent.trim() : "Unknown";
  
  // Create the final JSON object with metadata
  const result = {
    metadata: {
      exportDate: new Date().toISOString(),
      browserVersion,
      totalExtensions: extensions.length
    },
    extensions: extensions.sort((a, b) => a.name.localeCompare(b.name))
  };
  
  // Format the JSON with indentation for readability
  const jsonOutput = JSON.stringify(result, null, 2);
  
  // Log the JSON to the console
  console.log(jsonOutput);
  
  // Helper function to get extension URL
  function getExtensionUrl(extensionId) {
    if (!extensionId) return null;
    
    // For AMO (addons.mozilla.org) extensions
    if (!extensionId.includes('@') && !extensionId.startsWith('{')) {
      return `https://addons.mozilla.org/firefox/addon/${extensionId}/`;
    }
    
    // For known extension IDs, map to their URLs
    const knownExtensions = {
      'uBlock0@raymondhill.net': 'https://addons.mozilla.org/firefox/addon/ublock-origin/',
      'treestyletab@piro.sakura.ne.jp': 'https://addons.mozilla.org/firefox/addon/tree-style-tab/',
      '@testpilot-containers': 'https://addons.mozilla.org/firefox/addon/multi-account-containers/',
      'firefox@tampermonkey.net': 'https://addons.mozilla.org/firefox/addon/tampermonkey/',
      '{e4a8a97b-f2ed-450b-b12d-ee082ba24781}': 'https://addons.mozilla.org/firefox/addon/greasemonkey/',
      '{ed630365-1261-4ba9-a676-99963d2b4f54}': 'https://addons.mozilla.org/firefox/addon/modheader-firefox/',
      '{0b289d05-9030-47a6-813b-aa80bbf959f5}': 'https://addons.mozilla.org/firefox/addon/quickey/',
      '{036a55b4-5e72-4d05-a06c-cba2dfcc134a}': 'https://addons.mozilla.org/firefox/addon/traduzir-paginas-web/'
    };
    
    return knownExtensions[extensionId] || null;
  }
  
  // Return the number of extensions found
  return `Found ${extensions.length} extensions. JSON data has been logged to the console.`;
})();
