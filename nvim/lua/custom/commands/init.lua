-- Setup Treesitter fold logic
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99 -- Start with all folds open

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Set the width of a tab to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Enable smart indentation
vim.opt.smartindent = true
vim.opt.autoindent = true

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

-- Tab navigation
vim.keymap.set('n', '<C-j>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-p>', ':BufferLinePick<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-c>', ':BufferLinePickClose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-c>', ':BufferLineCloseOthers<CR>', { noremap = true, silent = true })

-- Keymaps for git-conflict plugin
vim.keymap.set('n', '<leader>co', '<Plug>(git-conflict-ours)', { desc = 'Accept current (ours)' })
vim.keymap.set('n', '<leader>ct', '<Plug>(git-conflict-theirs)', { desc = 'Accept incoming (theirs)' })
vim.keymap.set('n', '<leader>cb', '<Plug>(git-conflict-both)', { desc = 'Accept both' })
vim.keymap.set('n', '<leader>c0', '<Plug>(git-conflict-none)', { desc = 'Accept none' })
vim.keymap.set('n', '<leader>cn', '<Plug>(git-conflict-next-conflict)', { desc = 'Next conflict' })
vim.keymap.set('n', '<leader>cp', '<Plug>(git-conflict-prev-conflict)', { desc = 'Previous conflict' })
