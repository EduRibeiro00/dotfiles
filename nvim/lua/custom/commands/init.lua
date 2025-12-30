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

-- Shortcut to save files
vim.keymap.set('n', '<leader>s', ':w<CR>', { noremap = true, silent = true, desc = 'Save file' })

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

-- Shortcut for opening a terminal
vim.keymap.set('n', '<leader>vt', ':term<CR>', { noremap = true, silent = true, desc = 'Open terminal buffer' })

-- Shortcut for Oil
vim.keymap.set('n', '-', function()
  require('oil').toggle_float()
end, { desc = 'Toggle Oil float' })

-- Tab navigation
vim.keymap.set('n', '<C-j>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-j>', '<Esc>:BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-k>', '<Esc>:BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n>:BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n>:BufferLineCycleNext<CR>', { noremap = true, silent = true })

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

-- Tab/buffer management
vim.keymap.set('n', '<leader>w', '<cmd>bd<cr>', { desc = 'Close current buffer' })
vim.keymap.set('n', '<leader>t', '<cmd>%bd|e#|bd#<cr>', { desc = 'Close all other buffers' })

-- Copy full file path with
vim.keymap.set('n', '<leader>cp', function()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('+', path)
  vim.api.nvim_echo({ { 'Copied file path' } }, false, {})
end, { desc = 'Copy full file path' })

-- Move selected lines up/down with Ctrl+Shift+J/K
vim.keymap.set('v', '<C-S-j>', ":m '>+1<CR>gv=gv", { desc = 'Move lines down', silent = true })
vim.keymap.set('v', '<C-S-k>', ":m '<-2<CR>gv=gv", { desc = 'Move lines up', silent = true })
vim.keymap.set('n', '<C-S-j>', ':m .+1<CR>==', { desc = 'Move line down', silent = true })
vim.keymap.set('n', '<C-S-k>', ':m .-2<CR>==', { desc = 'Move line up', silent = true })

-- Tab/Shift+Tab for indent/unindent in visual and normal mode
vim.keymap.set('v', '<Tab>', '>gv', { desc = 'Indent selection', silent = true })
vim.keymap.set('v', '<S-Tab>', '<gv', { desc = 'Unindent selection', silent = true })
vim.keymap.set('n', '<Tab>', '>>', { desc = 'Indent line', silent = true })
vim.keymap.set('n', '<S-Tab>', '<<', { desc = 'Unindent line', silent = true })

-- Quickfix list commands
vim.keymap.set('n', '<C-n>', '<cmd>cnext<CR>', { desc = 'See next result in quickfix list', silent = true })
vim.keymap.set('n', '<C-p>', '<cmd>cprev<CR>', { desc = 'See previous result in quickfix list', silent = true })
