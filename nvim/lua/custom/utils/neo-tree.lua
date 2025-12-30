local M = {}

-- Function for toggling focus between neo-tree buffer and main buffer
M.toggle_neotree_focus = function()
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_get_current_buf()
  local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = current_buf })

  if buf_ft == 'neo-tree' then
    -- You're in Neo-tree, go to the other window
    vim.cmd 'wincmd p'
  else
    -- Not in Neo-tree, try to go to Neo-tree if it's open
    local wins = vim.api.nvim_list_wins()
    for _, win in ipairs(wins) do
      local buf = vim.api.nvim_win_get_buf(win)
      local ft = vim.api.nvim_get_option_value('filetype', { buf = buf })
      if ft == 'neo-tree' then
        vim.api.nvim_set_current_win(win)
        return
      end
    end
    -- If Neo-tree isn't open, optionally open it
    vim.cmd 'Neotree toggle' -- or Neotree focus if you don't want to toggle
  end
end

return M
