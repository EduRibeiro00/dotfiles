-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  -- One dark themes
  {
    'navarasu/onedark.nvim',
    priority = 1000, -- load early
    config = function()
      require('onedark').setup {
        style = 'darker', -- other styles: 'cool', 'warm', 'warmer', 'deep'
        transparent = 'true',
      }
      require('onedark').load()
    end,
  },
  -- Nightfox themes
  -- {
  --   'EdenEast/nightfox.nvim',
  --   priority = 1000, -- so it loads before other UI stuff
  --   config = function()
  --     require('nightfox').setup {
  --       options = {
  --         styles = {
  --           comments = 'italic',
  --           keywords = 'bold',
  --           functions = 'italic,bold',
  --         },
  --         transparent = 'true',
  --       },
  --     }
  --     vim.cmd 'colorscheme carbonfox' -- options: carbonfox, nightfox, duskfox, nordfox, terafox
  --   end,
  -- }
}
