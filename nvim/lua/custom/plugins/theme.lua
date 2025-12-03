local themes = {
  -- One dark theme
  ['onedark'] = {
    'navarasu/onedark.nvim',
    priority = 1000, -- load early
    config = function()
      require('onedark').setup {
        style = 'darker', -- other styles: 'cool', 'warm', 'warmer', 'deep'
        -- transparent = 'true',
      }
      require('onedark').load()
    end,
  },

  -- Nightfox theme
  ['nightfox'] = {
    'EdenEast/nightfox.nvim',
    priority = 1000, -- so it loads before other UI stuff
    config = function()
      require('nightfox').setup {
        options = {
          styles = {
            comments = 'italic',
            keywords = 'bold',
            functions = 'italic,bold',
          },
          -- transparent = 'true',
        },
      }
      vim.cmd 'colorscheme carbonfox' -- options: carbonfox, nightfox, duskfox, nordfox, terafox
    end,
  },
}

local ACTIVE_THEME = 'nightfox'

return themes[ACTIVE_THEME]
