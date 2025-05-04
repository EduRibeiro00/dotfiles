-- Map 'ç' to go to the next code block
vim.api.nvim_set_keymap('n', 'ç', '}', {
  noremap = true,
  silent = true,
})

-- Map 'Ç' to go to the previous code block
vim.api.nvim_set_keymap('n', 'Ç', '{', {
  noremap = true,
  silent = true,
})

-- Clear search results if they exist using escape key
vim.keymap.set('n', '<Esc>', function()
  if vim.fn.getqflist({ winid = 0 }).winid ~= 0 then
    vim.cmd 'cclose' -- Close quickfix window
  elseif vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 then
    vim.cmd 'lclose' -- Close location list if it's open
  elseif vim.v.hlsearch == 1 then
    vim.cmd 'nohlsearch' -- Close search if it's open
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
  end
end, { noremap = true, silent = true })

-- Setup Treesitter fold logic
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99 -- Start with all folds open
