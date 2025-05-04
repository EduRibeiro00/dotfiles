-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>e', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<leader>m', require('custom.utils.neo-tree').toggle_neotree_focus, desc = 'NeoTree focus toggle', silent = true },
  },
  opts = {
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      window = {
        mappings = {
          ['<leader>e'] = 'close_window',
          ['.'] = 'toggle_hidden',
        },
      },
    },
    window = {
      mappings = {
        ['l'] = 'open',
      },
    },
  },
}
