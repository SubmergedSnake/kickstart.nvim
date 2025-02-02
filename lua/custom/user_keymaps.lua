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

-- CodeCompanion
vim.keymap.set('n', '<leader>tc', ':CodeCompanionChat Toggle<CR>', { desc = 'Toggle CodeCompanion Chat' })
vim.keymap.set('v', '<leader>ex', ':CodeCompanion /explain<CR>', { desc = 'Explain visually selected code' })
vim.keymap.set('n', '<leader>lex', ':CodeCompanion /lsp<CR>', { desc = 'Explain diagnostic error' })
vim.keymap.set('v', '<leader>fix', ':CodeCompanion /fixcode<CR>', { desc = 'Fix visually selected code' })
vim.keymap.set('v', '<leader>gu', ':CodeCompanion /tests<CR>', { desc = 'Generate unit tests for visually selected code' })

-- keymaps for quick buffer, args list navigation
vim.keymap.set('n', '<C-M-o>', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<C-M-i>', ':bprevious<CR>', { desc = 'Prev buffer' })
vim.keymap.set('n', '<M-o>', ':next<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<M-i>', ':previous<CR>', { desc = 'Prev buffer' })
