return {
  'mg979/vim-visual-multi',
  branch = 'master',
  init = function()
    vim.g.VM_theme = 'iceblue' -- Available: 'iceblue', 'ocean', 'sand', 'purplegray', 'codedark'
    vim.g.VM_highlight_matches = 'underline' -- How to highlight matches
    vim.g.VM_maps = {
      ['Find Under'] = '<C-d>', -- Ctrl+d to select next occurrence
      ['Find Subword Under'] = '<C-d>',
      ['Select All'] = '<C-a>',
      ['Skip Region'] = '<C-x>',
      ['Remove Region'] = '<C-p>',
      ['Add Cursor Down'] = '<C-Down>',
      ['Add Cursor Up'] = '<C-Up>',
      ['Toggle Cursor'] = 'v', -- Toggle cursor at current position
    }
  end,
}
