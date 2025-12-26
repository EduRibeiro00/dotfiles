return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function()
      require('oil').setup {
        float = {
          padding = 2,
          max_width = 90,
          max_height = 0,
          border = 'rounded',
          win_options = {
            winblend = 0,
          },
        },
        keymaps = {
          ['g?'] = 'actions.show_help',
          ['<CR>'] = 'actions.select',
          ['<C-s>'] = 'actions.select_vsplit',
          ['<C-h>'] = 'actions.select_split',
          ['<C-t>'] = 'actions.select_tab',
          ['<C-p>'] = 'actions.preview',
          ['<C-c>'] = 'actions.close',
          ['q'] = 'actions.close',
          ['<C-l>'] = 'actions.refresh',

          -- Specify mode with a table
          ['l'] = {
            callback = function()
              require('oil.actions').select.callback()
            end,
            mode = 'n', -- Only in normal mode
            desc = 'Open file/folder',
          },
          ['h'] = {
            callback = function()
              require('oil.actions').parent.callback()
            end,
            mode = 'n', -- Only in normal mode
            desc = 'Go to parent directory',
          },

          ['-'] = 'actions.parent', -- Alternative for going up
          ['_'] = 'actions.open_cwd',
          ['`'] = 'actions.cd',
          ['~'] = 'actions.tcd',
          ['gs'] = 'actions.change_sort',
          ['gx'] = 'actions.open_external',
          ['g.'] = 'actions.toggle_hidden',
          ['g\\'] = 'actions.toggle_trash',
        },
        -- Use default delete_to_trash on your OS
        delete_to_trash = true,
        skip_confirm_for_simple_edits = false,
        view_options = {
          show_hidden = false,
        },
      }
    end,
  },
}
