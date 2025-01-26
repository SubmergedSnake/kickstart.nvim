-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Nvimtree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')

-- Args list functionality
vim.keymap.set('n', '<leader>aa', ':arga<CR>', { desc = 'Add this buffer to the args list' })
vim.keymap.set('n', '<leader>ad', ':argd<CR>', { desc = 'Delete this buffer from the args list' })
vim.keymap.set('n', '<leader>al', ':args<CR>', { desc = 'Show the args list' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
